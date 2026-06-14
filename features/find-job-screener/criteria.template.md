# Target Roles: Criteria Template

> Copy this to your own criteria file (e.g. `target-roles.md`) **outside the repo or in a gitignored path**, and fill in your values. The categories below are the pattern; the values are yours and never get committed. The screener loads this file verbatim and applies it in order. The pipeline never edits it.
>
> Design rule: any criterion that can't be tested from the JD plus ~10 minutes of research doesn't belong here. Move it to interview-stage notes.

## Must-Haves (binary disqualifiers)

Each one reduced to a screener-testable check with an explicit **PASS / FAIL / AMBIGUOUS** rule, including what happens when the JD is silent. `AMBIGUOUS` routes to clarify-first; it is **not** a FAIL, and the screener never invents a value.

- **<must-have 1>**, e.g. working language. _Rule:_ PASS if JD states `<…>`; FAIL if `<…>`; AMBIGUOUS if unstated → confidence note.
- **<must-have 2>**, e.g. hands-on vs advisory. _Rule:_ …
- **<location ceiling>**, e.g. "at most N office days per fortnight, in these cities". _Rule:_ scan the JD body for office-cadence phrases and residence-scoped remote ("remote across these countries" with yours missing); AMBIGUOUS when silent.
- **<comp floor>**. _Rule:_ check stated salary against your floor; AMBIGUOUS when absent (never inferred).

## Positive signal markers

Observable evidence the role is genuinely what it claims. Verdicts key off counts (e.g. GO needs ≥3 high-signal markers).

- **High-signal** (hard to fake): the JD uses domain vocabulary natively; responsibilities are shaped by the domain; engineering blog / open-source work backs it up; `<your markers>`.
- **Medium-signal:** `<…>`
- **Low-signal:** `<…>`

## Vocabulary diagnostic

The single most discriminating test. Three buckets: the screener records distinct matched terms and counts for A and C on every verdict, which is what makes its calls legible. Absence is signal too.

- **Bucket A, presence is positive signal:** `<term>, <term>, …`
- **Bucket B, neutral, appears everywhere, not counted:** `<term>, <term>, …`
- **Bucket C, presence is a red flag for this role type:** `<term>, <term>, …`

## Dealbreakers (hard-PASS overrides)

Beat any other verdict.

- e.g. "title claims the specialism but bucket A is empty and bucket C is loaded."
- `<your dealbreakers>`
