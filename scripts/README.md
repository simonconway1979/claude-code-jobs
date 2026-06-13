# scripts/ — fast test loop for the skills

Two scripts for iterating on this repo's skills (`/os-start`, `/os-save`) and context without a full git round-trip each time. Ported from the os-intelligence test workflow.

## The two loops

| Script | What it does | When to use |
|---|---|---|
| `sync-test.sh` | `cp -R` the working tree into `~/Code/claude-code-jobs-test-fast`. No git, sub-second, picks up uncommitted edits. | Fast iteration on the `/os-start` briefing and context. The default loop. |
| `refresh-test.sh` | `rm -rf` + `git clone` fresh from GitHub (SSH) into `~/Code/claude-code-jobs-test-1`. | Honest pre-share check: tests the real new-contributor install path. Requires commit + push first. |

Rule of thumb: if your change could affect what a fresh `git clone` produces, use `refresh-test.sh`; otherwise `sync-test.sh`.

## Run them

```
bash scripts/sync-test.sh
bash scripts/refresh-test.sh
```

Then open the test dir in a separate Claude Code window and run `/os-start`. Re-run the script after each edit to reset to a clean tree.

## Two things to know

1. **Run from a real terminal**, not Claude's sandboxed bash. On macOS, files Claude writes are tagged `com.apple.provenance`, and a sandboxed `rm`/`cp` over them fails with "Operation not permitted." Use Terminal, or the `!` prefix in the Claude prompt.
2. **Testing `/os-save` pushes to the real repo.** `/os-save` opens a real branch + PR on GitHub by design, so a test run leaves a test branch/PR behind. That's fine on a private repo — just delete them after. `sync-test.sh` copies keep this repo's remote, so they push to the real repo too.
