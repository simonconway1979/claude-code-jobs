---
name: os-save
description: Save your session — write a build-log entry, commit everything on your branch, push, and open (or update) your pull request. Never touches main.
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

## Step 3 — Commit and push

1. `git add -A`
2. `git commit -s -m "<one-line summary of the session>"` — the `-s` adds the DCO `Signed-off-by:` line (see `CONTRIBUTING.md`).
3. `git push -u origin HEAD`

## Step 4 — Pull request

Check for an open PR on this branch: `gh pr view --json state 2>/dev/null`.

- None: `gh pr create --fill --base main`. The PR body answers one question: what does this let the team do now?
- Exists: the push already updated it. Say so.

## Step 5 — Confirm

Print the PR URL and one line on what was saved. That's the contribution, attributed and centrally visible.
