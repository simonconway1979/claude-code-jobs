---
# Worked EXAMPLE criteria file: fictional, for copying the structure.
# Persona: "Alex Rivera", a Senior/Staff PM hunting AI-native product roles.
# Every value below (comp, location, companies) is illustrative. Replace with your own.
# This is not anyone's real search. The blank version is criteria.template.md.
example: true
---

# Target Roles: Example (Alex Rivera)

> **How this file is used.** The screener loads this file verbatim and screens fresh JDs against it. Verdict bins:
> - **GO**: passes all Must-Haves + meets ≥3 APEX signals (see Ideal Role Profile)
> - **EXPLORE**: passes Must-Haves but missing signals, OR signals present with one ambiguous Must-Have, OR title is a step-up needing warm-route validation before cold-apply, OR employer is agency-anonymised despite an "AI-native" claim, OR sub-floor comp + strong AI signals (surface for review, helps refine the floor over time). EXPLORE is also right when a rule needs human clarification before a verdict finalises.
> - **PASS**: fails any Must-Have, OR no signals + no transformation language
> - **BRIDGE**: fails career-track Must-Haves but passes the optional Bridge Guardrail § 4
>
> Any criterion that can't be reduced to a screener-testable check doesn't belong here. Move it to interview-stage notes.

---

## Ideal Role Profile (the APEX)

**Title range:** Senior PM / Staff PM / Head of Product / Principal PM / AI Product Lead
**Industry:** Open (track record spans several sectors)
**Location:** Lisbon-based. Works with: remote-first (work from Lisbon), genuinely flexible hybrid, or US-remote-from-Lisbon. **Hard ceiling on in-office presence: ~2 days per fortnight steady state** (can front-load presence during onboarding, heavier for the first 1–2 months). Recurring multi-day-per-week hybrid elsewhere in Europe is OUT, as is full relocation. See § Must-Haves → Location.

**What good looks like:** Senior/Staff PM at an **AI-native company that works AI-native**.
- **AI-native company**: product strategy *is* AI; not "we add AI features."
- **Works AI-native**: the team's daily operating practice uses AI tools as table stakes (Cursor / Claude Code / Copilot / equivalent), not occasional or single-person tool use.

### APEX signals (observable from JD + ≤10 min company research)

**High-signal (hard to fake):**
- **Transformation language in the JD**: high rate of change, "doing things differently," role is *part of* the transformation, not bolted onto a settled motion. (Time-bounded signal: high-value while AI-native ways of working are still novel; expected to fade as the market settles.)
- **Engineering blog posts about agentic systems, evals, context engineering**: recent (last 6mo), authored by named engineers, not marketing
- **Public open-source AI work**: repos, contributions to agent / MCP frameworks
- **Founder/leadership demoing AI tools publicly**: talks, podcasts, posts showing actual use, not endorsement
- **JD uses AI vocabulary natively**: agent / evals / RAG / context window / MCP appear without being explained
- **Hiring AI-shaped PM roles**: JD includes agent/eval responsibilities; not a traditional PM JD with "and AI" appended

**Medium-signal:**
- Tools named in the JD or careers page (as stack, not perk)
- Recent AI-focused funding round with a public AI roadmap
- Engineering team mentions "AI-paired development" in JD/eng blog
- Named PMs visible in eng work / public PM content (proxy for product culture)

**Low-signal (don't lean on these):**
- "AI-first" in marketing copy
- An AI coding tool listed only in perks/benefits
- "We use ChatGPT internally" without team-practice integration
- "AI" in the company name without shipped AI products

### Thresholds

- **GO:** ≥3 high-signal markers + passes Must-Haves
- **EXPLORE:** 1–2 high-signal markers + several medium markers + passes Must-Haves
- **PASS:** No high-signal markers and no transformation language: "not AI-native, just AI-flavoured"

---

## Must-Haves

Binary disqualifiers. Failing any = PASS (or BRIDGE if the optional Bridge Guardrail § 4 is met).

- **AI-native team practice**: team operates with Claude Code / Cursor / Copilot / equivalent as core daily practice, not occasional or single-person use. Concrete test: "How does your team use AI day-to-day?" Vague, aspirational, or one-person answers fail.
- **Hands-on PM work**: not a pure strategy or advisory role
- **English-language role**
- **Location / in-office presence**: Lisbon-based, hard ceiling **~2 days per fortnight** in-office at steady state (front-loaded onboarding fine). Works only with: remote-first (from Lisbon), flexible hybrid within that ceiling, or US-remote-from-Lisbon. **FAIL** = JD mandates recurring multi-day-per-week (≈3+ days/week, or any fixed "N days/week in office") onsite presence elsewhere, or requires relocation. **AMBIGUOUS** = "hybrid" stated without cadence, or remote policy unstated → EXPLORE, confirm cadence with the recruiter before investing (don't FAIL on missing data). *This is the criterion that catches the hard-office-mandate employer before it's pursued as a high-fit role.*
- **Comp floor (career-track)**: *illustrative figures; set your own:*
  - **EU / EMEA-remote:** €110k base floor, €130k+ target
  - **US-remote / relocation:** €140k floor, €160k+ target (US market premium)
  - **Sub-floor JDs with strong AI signals → EXPLORE, not PASS.** Surfaces for review so the floor refines over time. Don't downgrade to PASS unless the sub-floor pattern repeats and you confirm.


---

## Strong Preferences

Ranked by screener-impact (most → least). These move EXPLORE → GO, not Must-Have → PASS.

1. **Tools named in the JD**: AI coding/agent tools as part of the stack or team practice, not just benefits.
2. **JD vocabulary uses agent / evals / RAG / context / MCP natively**: table-stakes terminology, not buzzwords needing explanation.
3. **Public engineering evidence of AI-native work**: eng blog about agents/evals (recent, named engineers), open-source AI repos, AI conference talks.
4. **Hiring AI-shaped PM scope**: JD includes agent or eval responsibilities, not traditional PM bolted with "and AI."
5. **Active-transformation language in JD**: high rate of change, "figuring it out," "shaping how we work."
6. **Context engineering / product-operations scope**: building the systems that make teams faster.
7. **Cross-functional coordination across multiple product teams.**
8. **People / Strategy / Craft remit**: not siloed in one lane.
9. **AI transformation scope alongside hands-on work.**
10. **Remote-first culture.**
11. **Named PMs visible in eng work / public PM content**: proxy for product culture.

---

## Vocabulary Diagnostic: AI-native PM vs Traditional PM

The single most discriminating screener test. AI-native and traditional PM JDs read **very differently**. The diagnostic looks at vocabulary **present** AND **absent**. Absence is signal.

### Vocabulary buckets

**A · AI-native PM vocabulary** (presence = positive signal):
agent / agentic / evals / eval datasets / RAG / context window / context engineering / MCP / fine-tuning / prompt engineering / LLM / model selection / model evaluation / latency / hallucination / agent orchestration / tool use / function calling / embeddings / vector store / multi-agent / reasoning / chain-of-thought

**B · Universal PM vocabulary** (neutral, appears in both):
stakeholder management / roadmap / OKRs / data-driven / prioritisation / user research / cross-functional / shipping cadence / discovery / outcomes / metrics

**C · Traditional-PM-only vocabulary** (presence in an AI-titled role = red flag):
PRDs as primary deliverable / detailed feature specs / "translates business requirements" / "owns the spec" / waterfall planning / fixed scope commitments / handoff to engineering / "manages the backlog"

### How the screener applies it

| Profile | Bucket A | Bucket B | Bucket C | Verdict signal |
|---------|---------|---------|---------|----------------|
| **APEX JD** | High (5+ terms) | Present | Low/absent | GO if Must-Haves pass |
| **Standard AI-native JD** | Medium (2–4 terms) | Present | Low | EXPLORE → GO if other signals stack |
| **Traditional PM with AI veneer** | Low (0–1 terms) | High | Medium-high | PASS, the "AI title, traditional-PM body" pattern |
| **Generic PM JD** | Absent | High | Present | PASS or BRIDGE per Guardrail § 4 |

### Output in screener run

For each JD, the screener records:
- AI-native vocab terms present (list them, count)
- Traditional-PM-only terms present (list them, count)
- Verdict driver: "title says X but vocab profile is Y"

This is the most legible verdict explanation: easier to spot-check than a single fit-score.

---

## Dealbreakers

Binary excludes. Hard PASS even if other signals are strong.

- **AI as marketing language, not practice**: see Ideal Role Profile § Low-signal.
- **Pure strategy role with no hands-on building.**
- **Toxic work culture**: flagged in research (public review patterns, ex-employee accounts, red flags from your network).
- **Embed-style role without the three conditions** (mandate + role-level scope + comp for scope): see Bridge Guardrail § 4(b). Without all three, you become the lone AI-native person doing invisible unpaid labour against team resistance.
- **Traditional-PM-language JD with an AI title**: title says "AI Product Manager" but the body reads as conventional PM work (PRDs, stakeholder management, roadmap planning) with no AI-native vocabulary. Apply the **Vocabulary Diagnostic**. If Bucket A is empty/sparse and Bucket C is high, decline even if the title is on-spec.

---

## Bridge Guardrail (optional)

> An example of a *personal* guardrail (here, a contract-income "bridge" that widens scope to "must touch AI, building optional" while protecting against the bridge becoming the destination). Include something like this only if it applies to you; delete otherwise. Figures illustrative.

- **Day-rate floor / target:** €600/day floor (decline below, the bridge isn't materially better than active search), €850/day target.
- **Length cap:** 6 months hard, single 3-month extension only if a career-track interview is mid-process or the bridge employer reveals an internal AI-native role you'd take.
- **AI minimum ("touches AI" test), ONE of:** (a) team already operates AI-native daily (test in interview; vague/one-person answers fail); OR (b) you're empowered to embed the practice, with **all three** of: leadership mandate (budget + named sponsor + authority), role-level scope (in the role definition, not bolted on), and comp that reflects the transformation scope.
- **Conversion-to-perm:** reassess any perm offer under career-track Must-Haves, not bridge-track. If it doesn't pass, decline. The bridge is a bridge; the destination is the destination.

---

## Target Companies

> Structure only. Fill with your own research. Keep real names and notes in a private file, not in a shared repo.

### Dream / Aspirational
*Long shots worth understanding even if a role is unlikely.*

| Company | What | Why | Status |
|---------|------|-----|--------|
| ‹frontier AI lab› | ‹what they do› | Direct alignment with how I work | Research needed |

### Tier 1: Strong Hypothesis (needs validation)
*AI tooling / AI-native product companies where the role likely involves real AI-native work.*

| Company | What | Geography | Status |
|---------|------|-----------|--------|
|  |  |  | Intelligence needed |

### Tier 2: AI Transformation at Scale
*Larger companies with genuine AI transformation programmes and hands-on PM scope.*

| Company | What | Geography | Status |
|---------|------|-----------|--------|
|  |  |  | Intelligence needed |

### Tier 3: Local / Remote (secondary)

| Company | What | Why | Status |
|---------|------|-----|--------|
|  |  |  | Research needed |

---

## Role Discovery Sources

- LinkedIn (primary)
- Company careers pages
- Network / listening-tour contacts
- AI / developer community (where Claude Code users gather)

---

## How this example was built

This file shows the *structure* of a criteria file that works; it's a fictional persona, not a real search. Build yours the same way the real one was: from a handful of **graded JDs** (roles you've personally decided GO / EXPLORE / PASS on) used to calibrate the thresholds. A criteria file derived from real verdicts beats one written from imagination, because every rule has a JD behind it.
