# Find-Job Screener

The first feature in Claude Code Jobs, and the one the project started from. It turns the nightly job-board firehose into a short, ranked, reasoned shortlist — GO / EXPLORE / PASS — screened against criteria you wrote yourself.

It's one lens (a job seeker's filter) on the wider [market read](../../docs/vision.md), not the whole project. But it's real, it's been running since March 2026, and it's where the build begins.

## What it does

Every evening it pulls fresh postings from your saved searches, drops anything you've already seen, and screens each remaining job against your criteria file — reading the actual JD body, not just the tags, so it catches the country-locked "remote" and office-day requirements that quietly sink applications. Each job comes back marked **GO**, **EXPLORE**, or **PASS** with a one-line reason and the signals it found, so you can argue with a call instead of trusting a score. GO verdicts arrive as pre-drafted candidate files; promoting one into your tracked pipeline is a single command.

The point isn't more jobs. It's spending your evening on the three that matter instead of the fifty that don't.

## What's in this folder

| File | What it is |
|------|-----------|
| `README.md` | This — what the screener is and how to get started. |
| `spec.md` | The full implementation spec: stages, data model, cadence, and what gets genericised before anything ships. The technical reference. |
| `criteria.template.md` | The **what** — your judgment about what makes a role worth your time. The part only you can write; copy it and fill it in. Your filled-in copy never goes in the repo. |
| `example.criteria.md` | A **worked, filled-in example** (fictional persona, illustrative values) so you can see a criteria file that works before writing your own. Copy its structure, not its values. |
| `queries.template.md` | The **how to fetch** — your saved searches, with the one-line "why" each query has to earn. |

The runnable skill will live at `.claude/skills/find-job-screener/` once the [port](spec.md) lands — it's the next build. Runs write dated output folders and state (candidates, dedup hashes, tracker) to a **local, gitignored path** — that's personal pipeline data and never gets committed (see [spec.md](spec.md) §5). When the port lands, its run path needs a `.gitignore` entry so this is protected by default.

## Getting started

1. Read [what-it-does.md](../../docs/what-it-does.md) for the plain-language version, then [quickstart.md](../../docs/quickstart.md) to set it up.
2. Copy `criteria.template.md` to your own criteria file and fill in your must-haves, signals, and vocabulary buckets — `example.criteria.md` shows a filled-in one to copy the shape from. **This is where the value lives** — a thoughtful criteria file with a basic fetch beats a clever pipeline with vague criteria every time.
3. Set your queries from `queries.template.md`.
4. Run it. (The skill is being ported; until it lands, the spec is the reference and filling out your criteria is a real first contribution.)

## The sanitisation line

This folder teaches *how* the screener works. It never carries *what* anyone's search contains — no real criteria values, no queries, no run data, no comp figures, no API keys. Section 5 of [spec.md](spec.md) spells out exactly what gets genericised. Bring your own key (see [START-HERE.md](../../START-HERE.md)).

## Want to improve it?

Section 6 of [spec.md](spec.md) lists the open build surface, roughly by payoff: a second job source, screening-prompt improvements, accuracy evals, a notification channel, a criteria-template library for other role archetypes, and scheduled-run hardening. The criteria-template library is pure markdown — a good first build with no code.
