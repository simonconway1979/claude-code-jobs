---
name: os-save
description: Save your session — write a build-log entry, refresh the current-state snapshot, commit everything on your branch, push, and open (or update) your pull request. Never touches main.
---

# /os-save — save session as a PR

## Step 1 — Guard

`git branch --show-current`. If it's `main`, stop: tell the contributor to run `/os-start` first so they're on their own branch. Never commit to main.

## Step 2 — Build log

Append a session entry to `build-log.md` (newest at bottom, it's append-only):

```
## YYYY-MM-DD — [github-username]
- What I did: ...
- What I learned: ...
- Open for someone else: ...
```

Draft it from the session; confirm with the contributor in one line, don't interrogate them.

If the session produced notes, reasoning, or feedback that isn't already in files, save it under `context/research/YYYY-MM-DD-<username>-<topic>.md` before committing.

## Step 3 — Current state

Update `context/current-state.md` so it reflects where the project stands **now**. This is the live snapshot `/os-start` reads to brief the next person — overwrite it, don't append. Create it if it's missing.

**Update, don't rewrite from scratch:** read the existing file, carry forward what's still true, change only what moved this session. Keep it to roughly one screen, covering:

- **What the project is** — one or two lines (the working definition, in case it has shifted).
- **Stage** — the current loop stage and what's actually happening in it.
- **Live vs in progress** — what exists and works today, what's being built.
- **Open / next** — the current open items (this is the live list; the build log keeps the per-session history).

Same sanitisation rule as the build log: project-level state only — where things stand, never anyone's personal data or raw session detail. It's a generated file, so keep it abstract.

## Step 4 — Commit and push

1. `git add -A`
2. `git commit -s -m "<one-line summary of the session>"` — the `-s` adds the DCO `Signed-off-by:` line (see `CONTRIBUTING.md`).
3. `git push -u origin HEAD`

## Step 5 — Pull request

Check for an open PR on this branch: `gh pr view --json state 2>/dev/null`.

- None: `gh pr create --fill --base main`. The PR body answers one question: what does this let the team do now?
- Exists: the push already updated it. Say so.

## Step 6 — Confirm

Print the PR URL. Then the **very last thing** written to the screen must be the confirmation block below, with nothing after it — so a returning contributor sees "SESSION SAVED" pinned at the bottom without hunting back through the text.

**Wrap the block in a fenced code block (```)** when you output it. This is essential: printed as plain markdown, `SESSION SAVED` above a line of dashes becomes a heading and the dash lines become horizontal rules, so it renders mangled. Inside a code fence the dashes stay literal.

End the response with exactly this (the outer ``` fence included):

````
```
Summary
[1–2 sentence description of the session's work, in the spirit of the PR description.]

-------------
SESSION SAVED
-------------
```
````
