# Current state

_The live snapshot of where Claude Code Jobs stands. Refreshed each `/os-save`; read by `/os-start` to brief the next person. Per-session history lives in `build-log.md`._

## What this is

The community's shared, living read on the Claude Code job market — which roles are real, who's hiring, what they pay, how it's all moving. Broad by design: it serves job-seekers, freelancers, founders, and people looking for collaborators. The find-job screener is the **first lens** on that read, not the product itself.

## Stage

**Research** — open to everyone. People test the method, react, bring prior work, and add ideas; contributions arrive as PRs via `/os-start` → `/os-save`. The loop: **Research → AI Build Club → Kill workshop → Launch**.

## Live vs in progress

**Live (in the repo):**
- The definition and value framing — `README.md` (front door), `docs/vision`, `what-it-does`, `research`, `ai-build-club`.
- The contributor model — `CONTRIBUTING.md` (you keep your work + credit; the community gets a permanent right to use it), Apache-2.0 + CC-BY-4.0, DCO sign-off wired into `/os-save`.
- The find-job screener as a documented feature — `features/find-job-screener/` (README, spec, criteria + queries templates, a fictional worked example). The method is real and running; the repo describes it.
- The working loop — `/os-start` and `/os-save` skills; `scripts/` test loop.

**In progress / not yet built:**
- The runnable screener skill (`.claude/skills/find-job-screener/`) — being ported; not yet runnable from the repo.
- The repo is still private; not yet opened to the community.

## Open / next

1. **Go live for research** — flip the repo public (or send collaborator invites), replace the `<owner>` placeholders with the real handle, and post the invite (`README` + `docs/research`).
2. **Catch up `decisions-log.md`** with the reframes — screener = one lens, the loop rename, the `features/` structure, the licensing norm.
3. **Port the find-job-screener skill** into `.claude/skills/`.
4. **Add the pre-publish sanitisation grep** (`features/find-job-screener/spec.md` §5) before outside contributions start bringing data.
5. **One newcomer dry-run** via `scripts/refresh-test.sh` before opening up.
