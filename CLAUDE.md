# Claude Code Jobs

A community-built tool from the Happy Operators community: what's actually moving in AI and Claude Code jobs right now, screened and ranked so you can act on it.

This repo is the team. All project context lives here, so your Claude session already knows what the project is and where it's up to. If something matters and it isn't in the repo, it didn't happen.

## One project, no picker

This is a single-project OS-Intelligence repo. `/os-start` drops you straight into this project — no menu. It reads `STAGE` to give you orientation matched to where the loop currently is.

## How the project runs

Repeating loops, four stages. The current one is in the `STAGE` file at repo root.

1. **research** — open to everyone. Install the product, test it, read the docs, ask Claude (or ChatGPT) about it, and save your feedback and reasoning. Your `/os-save` becomes a PR in your name.
2. **build** — AI Build Club (~6 builders) turns the research into working features.
3. **playback** — prototypes demoed to the community; every feature gets a public kill / iterate / go-live verdict, recorded in `context/decisions-log.md`.
4. **adoption** — go-live features ship; the community installs and uses them. That feedback opens the next loop.

## How to contribute

Everything arrives as a pull request: feedback, reasoning saves, ideas, docs, code, half-built things. One question gates a merge: what does this let the team do now?

1. Read `START-HERE.md` (once).
2. Run `/os-start` — it checks your GitHub login, creates your branch, and briefs you.
3. Do your thing. Ask Claude about anything in the repo; if the context can't answer, filing that gap is itself a valid contribution.
4. Run `/os-save` — commits, pushes your branch, opens (or updates) your PR.

Never commit to main. The skills won't, and neither should you.

## Where things live

- `context/` — shared project knowledge: how the pipeline works, what the community asked for, decisions log, ideas
- `.claude/skills/` — the working skills, starting with the job-search pipeline port
- `build-log.md` — append-only async log; every working session ends with a few lines here (what I did, what I learned, what's open). This replaces standups.
- `outputs/` — the product as it forms
- `scripts/` — fast test loop for iterating on the skills (`scripts/README.md`)
- `STAGE` — the loop stage `/os-start` orients you to

## The sanitisation rule

This repo teaches how the system works, never what anyone's personal job search contains. No API keys (bring your own, see `START-HERE.md`), no personal screening values, no real application data. PRs that break this don't merge.

## Writing style

Shorter is better. Specific over generic. Every doc helps someone decide or act.
