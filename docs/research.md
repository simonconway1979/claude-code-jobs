# Claude Code Jobs: Research stage

[← Back to the landing page](../README.md)

**▶ ① Research, you are here**  ·  [② AI Build Club](ai-build-club.md)  ·  ③ Kill workshop  ·  ④ Launch

The project runs as a repeating four-stage loop. **Research** is the open one (anyone can take part, no build skills needed) and right now it's where we are. The [AI Build Club](ai-build-club.md) turns what comes out of here into working features; the Kill workshop demos them and gives each a public kill / iterate / go-live call; Launch ships the survivors and the community uses them for real, which opens the next loop.

---

## The goal of this stage

Get what's in the community's heads into the repo, before anyone builds a thing.

You live inside the Claude Code job market. That's exactly the knowledge no job board has and the whole project depends on. So this stage collects it:

- **What you need**: what would genuinely help you in this market, and what you'd love to see exist.
- **What you've tried before**: tools, scripts, spreadsheets, prompts. What worked, what didn't, what you'd do differently.
- **What causes you pain**: the parts of searching, hiring, or reading the market that are slow, noisy, or impossible today.
- **Examples from the market**: real signals you've noticed: roles that were/weren't what they claimed, pay surprises, which skills are suddenly everywhere.
- **What this project could be**: your unconstrained take. The direction is wide open and the good ideas come from here.

None of it has to be polished. A paragraph that starts "what I'd really love is…" or "here's what I built and where it fell over" is a complete contribution.

## How to take part

About 15 minutes to get going. You don't need to be a builder.

**1. Get set up (once).** A GitHub account with your invite accepted, the GitHub CLI, and Claude Code installed. Full setup is in [START-HERE.md](../START-HERE.md).

**2. Download the repo and start Claude.**

```
gh repo clone simonconway1979/claude-code-jobs
cd claude-code-jobs
claude
```

**3. Run `/os-start`.** It checks your GitHub login, puts you on your own branch, and briefs you on where the project's up to.

**4. Review the current context.** Everything about the product lives in the repo, so you can find out as much as you want before adding anything. Just ask Claude: "what is this?", "how does the screener work?", "what's already been suggested?", "what's still open?" The shared context answers; no meeting needed.

**5. Add what you've got.** Your ideas, your prior work, your market insights, what you need and would love to see, where you think this could go. Tell Claude and it'll save it in the right place: drop ideas in `context/ideas/`, write up prior work as its own note, or just talk it through and let it capture the reasoning.

**6. Run `/os-save`.** It commits your work, pushes your branch, and opens a pull request in your name. That PR is your contribution, attributed to you, visible to everyone.

## What happens to it

Everything lands as a PR, so it's all in one place and nothing's lost. When Build Club picks up, it builds from this. And because Claude can read across everyone's contributions at once, two people who've quietly built or wished for the same thing become a signal worth acting on rather than a coincidence nobody noticed.

---

[← Back to the landing page](../README.md)  ·  New here? Start with [why this matters](vision.md).
