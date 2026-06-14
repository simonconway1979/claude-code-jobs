# Start here

Target: cloned to oriented in under 15 minutes, first contribution inside your first session. No meetings, no walkthroughs.

## Setup (once)

1. A GitHub account, with your collaborator invite accepted.
2. The GitHub CLI: `brew install gh` (Mac) or [cli.github.com](https://cli.github.com), then `gh auth login`.
3. [Claude Code](https://claude.com/claude-code) installed.
4. Clone:

```
gh repo clone <owner>/claude-code-jobs
cd claude-code-jobs
claude
```

## Every session

1. Run `/os-start`. It verifies your GitHub login, puts you on your own branch, and briefs you on the project's current state and stage.
2. Work. Ask Claude anything about the repo — "how does the screening step work?", "what did the last person add?", "what's open?". The shared context answers; no human needed.
3. Run `/os-save`. It commits your work, pushes your branch, and opens (or updates) a pull request in your name. That PR is your contribution.

## What counts as a contribution

The bar is deliberately low, and that's the point:

- Feedback from testing the product
- A saved reasoning session
- An idea (a file in `context/ideas/`)
- "This is what I already built" with a writeup
- A fix to context that couldn't answer your question
- Code

Before your first PR, read [CONTRIBUTING.md](CONTRIBUTING.md) — the short version: you keep your work and your credit, the community gets a permanent right to use it, and you only contribute what's yours to give. `/os-save` signs your commits off for you.

## Your API keys

The pipeline talks to external job APIs. Keys never go in this repo. Put yours in `~/.config/ccmi/.env` (chmod 600) and the skills will source it. The orientation walks you through this when you first need it.
