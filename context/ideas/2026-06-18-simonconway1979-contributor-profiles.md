# Idea: contributor profiles (a public people-registry)

## What it is

A lightweight, public registry of the people in the community. One self-authored file per contributor (e.g. `community/contributors/<handle>.md`) holding their GitHub handle, links, what they're here for (searching, hiring, freelancing, building, or watching), what they've contributed, and what they can help with or are looking for. Each person owns and edits their own file via a normal PR, so it's opt-in by construction.

The payoff that's unique to this project: Claude can read across the whole set to connect people. Who's building the same thing, who's hiring versus looking, who could collaborate. That's the same cross-reading power the landing page already promises for the job market, pointed at the community itself.

## Who it helps

- **Contributors:** a face and a track record in the community, attribution beyond raw git history.
- **People looking for collaborators:** a stated goal in the vision. The registry is the matching surface that makes it real.
- **The team:** routing work to whoever's interested, and a clear view of who's actually engaged.
- **Returning contributors:** `/os-start` can greet them and recall what they're working on; `/os-save` can offer to log what they did this session.

## The privacy boundary (non-negotiable, because the repo is public)

This is the part that has to be right, and it is where the analogy to a private PM stakeholder system breaks.

- **Public-safe and consented only:** handle, links, stated interests, contributions, what you offer or seek as a collaborator.
- **Never:** personal job-search data (criteria, comp expectations, who you applied to). That is the sanitisation rule, and it is exactly the personal data that must stay out of a public repo.

This is **not** a port of a private stakeholder-intelligence system. Those rely on a private layer (honest political reads, hidden agendas) that only works in a closed workspace. There is no private layer in a public repo, so that model does not transfer. Self-authoring is the safeguard: nobody profiles anyone else.

## Smallest version worth building

1. A `community/contributors/` directory with a one-page template: handle, here-for, links, what-I-built, what-I-want.
2. Each person adds their own file via a normal PR (consent built into the mechanism).

Then, in rough order of payoff:

3. `/os-save` offers to append this session's contribution to your file; `/os-start` greets you from it.
4. A Claude-run "who should talk to whom" pass across the profiles (the collaborator-matching the vision promises).

## Open questions

- Directory home: `community/contributors/` vs `context/people/`.
- How much to auto-generate from git and PR history versus self-author.
- Whether watchers (non-contributors) get profiles too, or only people who have shipped a PR.
