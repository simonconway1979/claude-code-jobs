# Build log

Append-only. Every working session ends with a few lines here: what I did, what I learned, what's open for someone else. This replaces standups. Newest at the bottom.

---

## 2026-06-12 — simonconway
- What I did: seeded the repo — CLAUDE.md, START-HERE.md, the /os-start and /os-save skills, stage marker set to research.
- What I learned: single-project os-start is mostly deletion; the stage-aware briefing is the new part.
- Open for someone else: the job-search pipeline port lands next (context/job-search-funnel-spec.md describes it); after that, anything in context/ideas/ is fair game.

## 2026-06-14 — simonconway
- What I did: added scripts/ — sync-test.sh (fast cp loop) and refresh-test.sh (fresh SSH clone), ported from os-intelligence, for iterating on the skills without a full git round-trip each time. See scripts/README.md.
- What I learned: testing /os-save always pushes a real branch + PR to this repo, so test branches need cleaning up after; the cp loop is best for the non-git /os-start briefing.
- Open for someone else: once the skills run clean, this is the loop to use for any skill or context change.

## 2026-06-14 — simonconway
- What I did: added a value-first docs layer (docs/vision, what-it-does, quickstart, landing) and split the team-OS material into context/ways-of-working.md + context/measures.md. Wired it together: CLAUDE.md now leads with the "why" docs, the funnel spec points newcomers to the plain-language version, and 5 method decisions logged in decisions-log.md.
- What I learned: the repo needed a value-before-method on-ramp — the spec alone read as how-to-build with no why-it's-worth-it.
- Open for someone else: the screening skill port is still the next build; quickstart points at it and flags the gap as a good first contribution.
