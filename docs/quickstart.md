# Quick start: screen jobs for yourself

Heads up on status: the screening skill is being ported into this repo right now — it's the first thing the build is producing. The method below is real and already running (this repo is seeded from a working version), so if a step points at a piece that hasn't landed in the repo yet, that gap is itself a good first contribution. See [vision.md](vision.md).

## What you need

- Claude Code installed.
- An account with a jobs API. The seed uses [TheirStack](https://theirstack.com). Your API key goes in a local env file, never in the repo — the pattern is `~/.config/<service>/.env`, `chmod 600`, sourced by your shell.

## The setup, in four moves

**1. Write your criteria.** This is the part that matters and the part only you can do. Copy the criteria template and fill in what makes a role worth your time: your must-haves (the binary dealbreakers — location, working language, level, pay floor), the signals that tell you a role is genuinely what it claims to be, and the words whose presence or absence gives it away. Spend your time here, because the plumbing is just plumbing and the criteria are the actual product.

**2. Set your searches.** Edit the query file with your target titles, the places you can really work, and how fresh a posting has to be. Each query earns its place with a one-line reason it exists, which is what keeps the set small and deliberate.

**3. Run it.** One command fetches the fresh roles, drops the ones you've seen before, screens the rest, and writes a verdict list into a dated run folder.

**4. Act on the output.** Open the run's decision list, scan the GOs, and promote the ones worth pursuing into a tracked opportunity with a single command. The EXPLOREs are the interesting middle — worth a look before you decide either way.

## Tuning it

When the screener gets a call wrong — passes something you'd have looked at, or flags something you wouldn't — log it. Those corrections are how the criteria sharpen over time, so the system improves on your feedback rather than on guesswork.

If you take one thing from this: the value lives in your criteria file, not the pipeline. A thoughtful set of criteria with a basic fetch beats a clever pipeline with vague criteria every time.

---

Full mechanics: [the screener's home](../features/find-job-screener/README.md) and its [spec](../features/find-job-screener/spec.md). What you actually get out of it: [what-it-does.md](what-it-does.md).
