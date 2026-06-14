# Claude Code Jobs

A community-built tool from the Happy Operators community: what's actually moving in AI and Claude Code jobs right now, screened and ranked so you can act on it.

This repo is the team. All project context lives here, so your Claude session already knows what the project is and where it's up to. If something matters and it isn't in the repo, it didn't happen.

## Start here (the why before the how)

Lead with the value, because that's why this is worth anyone's time:

- **[docs/vision.md](docs/vision.md)** — why this matters: what it's worth to individuals, the community, and community leaders, and what it could become.
- **[docs/what-it-does.md](docs/what-it-does.md)** — the job screener we start from, in plain terms (one lens on a broader market read).
- **[docs/quickstart.md](docs/quickstart.md)** — set it up to screen jobs for yourself.

Then, if how the team works interests you (it's the secondary benefit, and the reason Simon's investing): **[context/ways-of-working.md](context/ways-of-working.md)**. The deep technical reference for the screener is **[features/find-job-screener/spec.md](features/find-job-screener/spec.md)**.

## One project, no picker

This is a single-project OS-Intelligence repo. `/os-start` drops you straight into this project — no menu. It reads `STAGE` to give you orientation matched to where the loop currently is.

## How the project runs

Repeating loops, four stages. The current one is in the `STAGE` file at repo root.

1. **research** — open to everyone. Install the product, test it, read the docs, ask Claude (or ChatGPT) about it, and save your feedback and reasoning. Your `/os-save` becomes a PR in your name. ([docs/research.md](docs/research.md))
2. **ai build club** — a small group (~5 builders) turns the research into working features, building fast and killing most of it on purpose (taste at speed). ([docs/ai-build-club.md](docs/ai-build-club.md))
3. **kill workshop** — prototypes demoed to the community; every feature gets a public kill / iterate / go-live verdict, recorded in `context/decisions-log.md`.
4. **launch** — go-live features ship; the community installs and uses them. That feedback opens the next loop.

## How to contribute

Everything arrives as a pull request: feedback, reasoning saves, ideas, docs, code, half-built things. One question gates a merge: what does this let the team do now? The licensing norm — you keep your work and credit, the community gets a permanent right to use it — is in [CONTRIBUTING.md](CONTRIBUTING.md).

1. Read `START-HERE.md` (once).
2. Run `/os-start` — it checks your GitHub login, creates your branch, and briefs you.
3. Do your thing. Ask Claude about anything in the repo; if the context can't answer, filing that gap is itself a valid contribution.
4. Run `/os-save` — commits, pushes your branch, opens (or updates) your PR.

Never commit to main. The skills won't, and neither should you.

## Where things live

- `docs/` — the reader-facing guides: vision (why), what-it-does, quickstart
- `features/` — the built tools, each self-contained with its own README. First one: `find-job-screener/` (the screener spec, criteria + query templates)
- `context/` — the working knowledge: how we work, the measures, the decisions log, ideas
- `.claude/skills/` — the working skills, starting with the find-job-screener port
- `build-log.md` — append-only async log; every working session ends with a few lines here (what I did, what I learned, what's open). This replaces standups.
- `outputs/` — the product as it forms
- `scripts/` — fast test loop for iterating on the skills (`scripts/README.md`)
- `STAGE` — the loop stage `/os-start` orients you to

## The sanitisation rule

This repo teaches how the system works, never what anyone's personal job search contains. No API keys (bring your own, see `START-HERE.md`), no personal screening values, no real application data. PRs that break this don't merge.

## Writing style

Shorter is better. Specific over generic. Every doc helps someone decide or act.
