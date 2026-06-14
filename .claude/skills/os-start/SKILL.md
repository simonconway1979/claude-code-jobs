---
name: os-start
description: Start a working session — verify GitHub identity, create or resume your branch, and get a stage-aware briefing on the project's current state.
---

# /os-start — single-project session start

This repo has one project. No picker. Three steps: identity, branch, briefing.

## Step 1 — Identity

Run `gh auth status`. If it fails, tell the contributor to run `gh auth login` themselves (it's interactive), then re-run `/os-start`. Don't proceed without it.

Get the username: `USER=$(gh api user -q .login)`.

## Step 2 — Branch

Never work on main.

1. `git fetch origin main`
2. Read the `STAGE` file at repo root (e.g. `research`, `build`, `playback`, `adoption`).
3. Look for an existing branch of this contributor for the current stage: `git branch --list "<stage>/$USER*" -a`. If one exists, check it out and pull. Otherwise: `git checkout -b <stage>/$USER-$(date +%Y%m%d) origin/main`.
4. Confirm to the contributor which branch they're on.

## Step 3 — Briefing

Read, in order: `CLAUDE.md`, `STAGE`, `context/current-state.md` (if present), the last ~30 lines of `build-log.md`, and `context/decisions-log.md` headings.

Then print a compact briefing:

```
CLAUDE CODE JOBS — [stage] stage

You're on branch: [branch]

**What this is:** [1-2 sentences from CLAUDE.md]
**Where it's up to:** [2-3 sentences from current-state + build log]
**Open right now:** [open items from the build log / decisions]

[Stage-specific orientation — see below]
```

Stage-specific orientation:

- **research:** "You're here to test and feed back. Install the product (ask me how), try it, read the docs, poke at the repo. Tell me your reactions as we go, or write notes — when you're done, run /os-save and your feedback becomes a PR in your name."
- **build:** "Pick something from the build queue (ask me what's open) or bring your own piece. Build log entry at the end of your session, then /os-save."
- **playback:** "Prototypes are being demoed and triaged. You can test anything in outputs/ and add your verdict evidence before the kill/iterate/go-live calls land."
- **adoption:** "The new version just shipped. Install it, use it for real, and file what works and what doesn't — that feedback opens the next loop."

End by asking what they want to do, not by listing options at them.
