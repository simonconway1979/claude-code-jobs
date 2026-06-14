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

## 2026-06-14 — simonconway1979
- What I did: bigger reframe — the project is now the community's shared *read on the Claude Code job market* (broad: employment, freelance, founders, finding collaborators), with the find-job screener as one lens, not the product. Added stage pages docs/research.md and docs/ai-build-club.md (taste-at-speed + the 5 Lenses, after Aakash Gupta / Boris Cherny). Renamed the loop to Research → AI Build Club → Kill workshop → Launch across CLAUDE.md and the docs. Added the contributor licensing norm: CONTRIBUTING.md (you keep your work + credit, the community gets a permanent right to use it), Apache-2.0 (LICENSE) + CC-BY-4.0 (LICENSE-content), DCO sign-off wired into /os-save. Gave the screener its own home at features/find-job-screener/ (README, spec moved from context/, criteria + queries templates, plus a fictional worked example).
- What I learned: treating the screener as "the product" was capping the vision; reframing it as one lens clarified everything downstream. Sanitisation has a non-obvious failure mode — a worked example, or even a build-log/research note, can leak personal data while the headline files look clean. The fix is to keep generated notes abstract.
- Open for someone else: port the find-job-screener skill into .claude/skills/; build the pre-publish sanitisation grep (spec §5) before the repo opens up; log the reframe decisions in decisions-log.md and add a context/current-state.md so the new definition is anchored before going to the community.

## 2026-06-15 — simonconway1979
- What I did: go-live prep. Promoted docs/landing.md to the root README.md so the repo has a real GitHub front door (added a status line + start-here pointer, repointed the tab/back links). Fixed a stale title in the os-start briefing (now "CLAUDE CODE JOBS"). Wired current-state into /os-save — it now refreshes context/current-state.md each save and ends with a pinned "SESSION SAVED" banner. Mapped the path to going live (now in current-state Open/next).
- What I learned: going live for the research stage doesn't need a runnable screener — research is feedback / ideas / prior work, so the bar is "a newcomer can clone, understand, and contribute." And os-start read current-state.md while nothing wrote it — that asymmetry is exactly why it was always missing.
- Open for someone else: flip the repo public (or send invites) and replace the <owner> placeholders with the real handle; port the find-job-screener skill; build the pre-publish sanitisation grep; catch up decisions-log with the reframes.

## 2026-06-15 — simonconway1979 (cont.)
- What I did: repo is now public. Replaced the <owner> placeholders in START-HERE.md and docs/research.md with the real handle so the clone command works as written. Fixed the /os-save "SESSION SAVED" banner to render literally — it's now emitted inside a code fence.
- What I learned: a dashed banner printed as plain markdown is parsed as a setext heading + horizontal rules, which mangles it; wrapping it in a code fence keeps the dashes literal.
- Open for someone else: turn on branch protection for main now it's public; do a newcomer dry-run (scripts/refresh-test.sh) before wider sharing; still open — port the screener skill, the sanitisation grep, and the decisions-log catch-up.
