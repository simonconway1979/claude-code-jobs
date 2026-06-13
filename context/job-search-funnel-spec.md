---
project: Happy Operators Community
type: foundation-spec
purpose: Sanitised writeup of the job-search funnel that seeds the Claude Code Jobs build
status: draft
created: 2026-06-12
sanitisation: teaches the how; contains no personal search data, no applied-to companies, no contacts, no comp figures, no keys
---

# Job-Search Funnel: Implementation Spec

This is the system the community build starts from. It's been running for real since March 2026, first as an n8n cron pipeline and now as a Claude Code skill. Everything below is the method. The criteria values, company names, and pipeline data from the original search stay out of the repo, and section 5 spells out exactly what gets genericised before anything goes public.

---

## 1 · What the funnel does

Every evening it pulls fresh job postings from a jobs API using a small set of saved queries, throws away anything it's already seen, screens each new posting against a criteria file you own, and bins every job into a verdict tier (GO / EXPLORE / PASS) with a one-line explanation of why. GO verdicts arrive as pre-drafted opportunity files, so promoting one into your tracked pipeline is a single command rather than a copy-paste session. The point isn't to find more jobs but to spend your evening on the three that matter instead of the fifty that don't.

```
queries.yaml ──> jobs API (TheirStack) ──> dedup against seen-hashes
                                                 │
                                          new postings only
                                                 │
                              screener (criteria file + screening prompt)
                                                 │
                        ┌────────────────────────┼────────────────────────┐
                       GO                     EXPLORE                    PASS
                        │                        │                        │
              draft candidate file      research queue / ask        logged, done
                        │               one clarifying question
                 human reviews
                        │
              promote ──> tracked opportunity folder + tracker row
                          (CV tailoring runs at this point)
```

Two architecture options exist, and both are proven:

- **v1/v2: n8n pipeline.** Cron-triggered n8n workflow: API fetch → cheap-model screen (Haiku, PASS/REJECT one-liner) → stronger-model scoring (Sonnet, weighted criteria score out of 10) → markdown files written to staged folders. Config lives in JSON files the workflow reads at runtime, so editing the config edits the live system without touching the workflow.
- **v3: Claude Code skill.** The fetch happens through the jobs API's MCP server, and the screening happens inside the same Claude session that runs the skill. No separate LLM calls, no workflow host, and the criteria file is loaded verbatim into context. This is the current production version and the recommended starting shape for the community build, with the n8n version available as the path to scheduled, hands-off runs.

## 2 · Stage by stage

### 2.1 Source: jobs API via saved queries

The source is the TheirStack jobs API (REST in the n8n version, MCP server in the skill version). Each query is a saved filter payload in a `queries.yaml`, and each returned job costs one API credit, so query design is the first cost lever. A query carries:

- **slug + a one-line "why"**: what gap this query fills that the others don't. Forcing the why keeps the query set small and intentional.
- **title filters**: the role archetypes you're hunting (e.g. senior/staff/lead variants of your target title), plus a `title_pattern_not` blocklist for title noise (in PM searches that means filtering "Product Marketing", "Product Designer", and the SAP world where "PM" means Plant Maintenance).
- **geography filters**: country codes plus location patterns matching where you can actually work.
- **freshness**: `posted_at_max_age_days`, default 14, widened per-run for a deeper sweep.
- **a description-level pattern filter**: a regex over the JD body that approximates your main screening gate at the API level. In the original system this was AI-native vocabulary (agent, LLM, RAG, evals, prompt engineering and so on), and adding it cut fetch volume by ~76% while keeping every job that later screened GO. This is the single highest-value query optimisation: push as much of your screen as possible into the API call, because filtered-out jobs cost nothing.
- **limit**: results cap per query, the second cost lever. 25 is a sane routine default; the skill checks the credit balance before running and warns if a run would burn more than a quarter of what's left.

### 2.2 Screening: a criteria file plus a screening prompt

The screen is two files, deliberately separated. The **criteria file** (`target-roles.md` in the original) is the what: it belongs to the person searching and never gets edited by the pipeline. The **screening prompt** (`screener-prompt.md`) is the how: per-JD instructions that load the criteria file verbatim and apply it in a fixed order. Keeping them apart means the community can improve the screening machinery without anyone's personal criteria living in the repo.

The criteria file follows a pattern, and these categories are the pattern, not anyone's values. Yours go here:

- **Must-Haves**: binary disqualifiers, each one reduced to a screener-testable check with an explicit PASS / FAIL / AMBIGUOUS rule. Examples of the shape: a working-language requirement, a hands-on-vs-advisory test, a comp floor checked only against stated salary data, and a **location ceiling** ("I can do at most N office days per fortnight, in these cities") with defined behaviour when the JD is silent. The design rule that makes this work: any criterion that can't be tested from the JD plus ten minutes of research doesn't belong in the file, so move it to interview-stage notes.
- **Positive signal markers**: observable evidence the role is genuinely what it claims, split into high-signal (hard to fake: the JD uses domain vocabulary natively, the role's responsibilities are shaped by the domain, engineering blogs and open-source work back it up) and medium/low tiers. Verdicts key off signal counts, e.g. GO needs three or more high-signal markers.
- **A vocabulary diagnostic**: the most discriminating single test in the original system. Three buckets: terms whose presence is positive signal (bucket A), neutral terms that appear everywhere (bucket B, not counted), and terms whose presence is a red flag for this role type (bucket C). The screener records distinct matched terms and counts for A and C on every verdict, which makes its calls legible: "title says X but the vocabulary profile is Y" is much easier to spot-check than a bare fit score. Absence of vocabulary is signal too.
- **Dealbreakers**: hard-PASS overrides that beat any other verdict, like "the title claims the specialism but bucket A is empty and bucket C is loaded."

Two screening lessons from running this live are worth baking in from day one. First, **read the JD body, not just the structured fields**: the API's `remote` flag and location field under-report hard gates, and on one apply pass every single dead application had failed on location, freshness, or language that was visible in the body text or the application form, with none failing on fit. So the prompt includes a body-level scan for office-cadence phrases and residence-scoped remote ("remote across these countries" with your country missing). Second, **AMBIGUOUS is not FAIL**: missing data routes to a clarify-first action, and the screener never invents criteria, since anything it thinks is missing goes into a confidence note for the human instead.

### 2.3 Dedup against previously-seen jobs

Before screening, each job is hashed and checked against a `dedup-hashes.json` state file:

```python
# title is lowercased and whitespace-collapsed before hashing
sha256(f"{company_id}|{title}")
```

Title normalisation is intentionally minimal. Seniority tokens stay, because "Senior PM" and "Staff PM" at the same company are different jobs, and a false dedup (silently dropping a real new role) costs more than re-screening a duplicate, which costs pennies. If the API's company id is missing, fall back to the normalised company name and log it. The hash file is append-only and written atomically (write to .tmp, rename), so a crashed run never corrupts state.

### 2.4 Verdict tiers

Every screened job gets exactly one verdict plus a one-line driver and a recommended next action:

| Verdict | Means | Next action |
|---------|-------|-------------|
| **GO** | All Must-Haves pass + enough high-signal markers | `apply`: draft candidate file written automatically |
| **EXPLORE** | Must-Haves pass but signals are thin, OR one Must-Have is AMBIGUOUS, OR the title is a step up that needs a warm route before a cold apply | `research-company`, `confirm-location-first`, or `warm-route-required` |
| **PASS** | Any Must-Have fails, or a dealbreaker fires | `decline`, logged |

EXPLORE is the deliberately interesting tier: it's the decision boundary, so every EXPLORE verdict is surfaced in full in the run retro for human review, and that review is how the criteria file improves. The original system added a fourth personal tier for contract work screened against separate guardrails, and the design supports any number of tiers as long as each maps to a testable rule plus a next action. Two priority flags ride alongside the verdict without ever changing it: `decay_risk` (promoted listing older than ~5 days, apply same-day or expect it closed) and `source_durable` (company-hosted ATS link, doesn't vanish the way promoted listings do).

### 2.5 Promotion to a tracked opportunity

A GO verdict isn't an application; it's a draft. The screener writes a pre-populated candidate file (frontmatter: company, role, stage, source query, verdict, vocab counts; body: JD excerpt plus the full screener JSON), and the human decides whether to promote. Promotion is a separate generic skill (`/os-new-item` in the original) that reads the draft frontmatter, copies a template folder into the tracked-opportunities directory, adds a row to the tracker, and then runs any portfolio-declared post-create action. In the original that action is CV tailoring: capture the full JD (the candidate file only holds a 500-character excerpt), save it as a raw doc, and produce a tailored CV draft for review. Tailoring lives at promote-time rather than at GO on purpose, since most GOs are never promoted and tailoring every one would be waste.

## 3 · Data model

```
automations/job-search/            # pipeline config + state (skill version)
├── queries.yaml                   # input: saved filter payloads, one why-line each
├── screener-prompt.md             # input: the how, per-JD screening algorithm
├── dedup-hashes.json              # state: seen (company_id, title) hashes
├── screener-stats.json            # state: cumulative-screened counter for eval triggers
└── screener-calibration.md        # log: append-only human-flagged mismatches

context/target-roles.md            # input: the what, YOUR criteria, never pipeline-edited

intelligence/candidates/runs/YYYY-MM-DD/   # output: one folder per run
├── query-<slug>.json              # raw API response per query (audit trail)
├── decisions.md                   # the scannable verdict table for the whole run
├── candidates/<slug>.md           # one draft file per GO verdict
└── retro.md                       # monitoring: counts, costs, all EXPLOREs, 3 random PASSes

opportunities/<slug>/              # post-promotion: one folder per tracked opportunity
├── opportunity.md                 # frontmatter: stage, fit, next action, last contact
├── intelligence/docs/raw/jd.md    # full JD as received, never edited
├── context/, people/, memory/     # research, contacts, session saves
TRACKER.md                         # one row per opportunity, the portfolio dashboard
```

The n8n version uses the same funnel with staged folders instead of run folders: `01-long-list/` (everything fetched) → `02-short-list/` (passed the cheap screen) → `02a-short-list-scored/` (scored by the stronger model) → `03-high-quality/` (above threshold), with filenames carrying date, score, and query tag (`YYYYMMDD-(7.2)-query-tag-company-title.md`) so the funnel can be measured with `ls | grep`. A parallel `TEST/` tree with limit-5 queries gives a cheap iteration sandbox, and a delete-test-outputs command resets it. Either layout works; the invariant is **long list → screened → scored/verdicted → high quality**, with every stage written to disk so the funnel is inspectable after the fact.

Stage model for tracked opportunities: `discovered → researching → engaging → applied → in-process → offer → closed`. The applied→in-process conversion rate is the key quality signal for the whole system, because it measures whether what the funnel surfaces actually converts.

## 4 · Cadence, and why nightly

Run it every evening, then apply to the freshest GOs within 24-48 hours. This isn't a style preference. Live data from the original system showed promoted listings on the big job boards closing at 6-7 days old, not the 30 you'd assume, and on one pass four of the day's targets had already stopped accepting applications. So the working rules are:

- **Nightly runs**, on demand rather than cron in the skill version (a human reviews output anyway, so a scheduled run that nobody reads just burns credits). The n8n version supports a daily schedule for the fetch.
- **Freshness window of 14 days** at the query level, but anything promoted and older than ~5 days carries `decay_risk` and sorts to the top of the apply list.
- **Decay is a sort key, never a gate.** An open role is applicable whatever its age; freshness only decides what you do first.
- **Durable sources sort above fragile ones** at equal fit, because a company-hosted ATS posting will still be there tomorrow and a promoted listing may not.

There's also a monitoring cadence. Every run's retro surfaces all EXPLORE verdicts plus three random PASSes for false-negative spot-checks, mismatches the human catches go into an append-only calibration log, ten log entries trigger a criteria review, and every 100 jobs screened triggers a 20-JD eval batch. The screener improves on a loop, not on vibes, and the one full calibration pass run so far found the fit engine accurate and the gate checks (location, language, freshness) too generous, which is exactly the kind of finding the loop exists to produce.

## 5 · What must be genericised before this goes in a community repo

The repo teaches the how. Nothing from the original search travels with it. Concretely:

1. **Criteria values.** `target-roles.md` ships as a commented template with the category structure (Must-Haves, signal tiers, vocabulary buckets, dealbreakers) and placeholder values. The original file contains personal location limits, comp floors, career strategy, and named companies, and none of it goes in. Same for `queries.yaml`: structure and the why-line convention ship, the actual queries don't.
2. **Pipeline data.** No run folders, no `dedup-hashes.json` contents, no calibration log entries, no candidate files, no tracker rows, no `opportunities/` folders. All of it encodes where one person applied and what they were offered. State files ship empty (`{"version": "2.0", "hashes": []}`).
3. **People and companies.** Validated screening lessons in the prompt are keyed to named companies and recruiters in the original. The lessons stay (they're encoded as rules in section 2 above), the names go.
4. **Keys and identifiers.** The TheirStack key lives in an env file outside the repo (the established pattern: `~/.config/<service>/.env`, chmod 600, sourced by the shell), and the MCP server is authorised per-user. No key, account id, or n8n instance URL appears in any committed file, and the n8n config JSONs get the same template treatment as the queries.
5. **Comp data.** No salary figures from the original criteria or from any screened JD. The comp-floor mechanism ships ("check stated salary against your floor, AMBIGUOUS when absent"), the numbers don't.

A pre-publish pass should grep the candidate repo for the original company names, person names, and currency amounts before the first push, and that check belongs in the repo as a script so every contributor can run it.

## 6 · Open build surface

First contributions an incoming builder could pick up, roughly in order of payoff per unit of effort:

1. **A second source.** The funnel is source-agnostic past the fetch stage. An adapter for another jobs API, an ATS aggregator, or an RSS/careers-page scraper that emits the same job object shape plugs straight into dedup and screening.
2. **Screening-prompt improvements.** The vocabulary diagnostic and the JD-body location scan are both v1 implementations with known gaps (the ranker under-weights durable-link, location-clean roles against high-vocab gated ones: a logged open issue). Better prompts are testable against the retro corpus.
3. **Screening accuracy evals.** The system already counts toward eval batches but the eval itself is manual. A graded JD test set plus a runner that scores a screener version against it would turn prompt changes from opinion into measurement. This is the contribution that compounds most.
4. **Notification channel.** Right now the output is a markdown summary in the terminal. A run-complete push (WhatsApp, Slack, email digest of GOs with links) makes the nightly cadence stick for people who don't live in the editor.
5. **Criteria-template library.** The original criteria file is tuned for one role archetype. Templates for other archetypes (engineer, designer, data) would widen who the tool serves on day one, and writing one is a pure-markdown contribution needing no code.
6. **Scheduled-run hardening.** Port the skill flow back onto n8n (or a cron + headless-Claude runner) for true hands-off nightly fetches, keeping the human review at the verdict stage. Be honest that this is the thinnest part of the spec: what's documented here is the n8n pipeline's *shape* (the fetch → Haiku screen → Sonnet score → staged-folder stages and the runtime-config-in-JSON pattern), not its node-by-node internals, so a rebuilder is reconstructing the workflow from the stage contract rather than porting an exported graph. The v3 skill is the version this doc actually specifies end to end.

---

*Sources: the jobs-find skill spec, the screener prompt and criteria file it loads, the query config, the n8n pipeline skills (production, test, and query-review), and the portfolio promotion skill, all in the private workspace. This document is the sanitised public-facing description; the private files are the reference implementation.*
