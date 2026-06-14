# Claude Code Jobs — AI Build Club

[← Back to the landing page](../README.md)

① Research  ·  **▶ ② AI Build Club — you are here**  ·  ③ Kill workshop  ·  ④ Launch

The AI Build Club is the build stage of the loop. A small group — around five builders — takes what the community surfaced in Research and turns it into working software, fast. The defining discipline isn't building. It's killing most of what gets built and shipping only the survivors.

---

## The bet: taste at speed

Building used to be the expensive part, so we wrapped it in process — specs, design reviews, sign-off — to make sure we only built the right thing. With Claude Code, a working prototype takes an afternoon, not six weeks. The bottleneck moves from *can we build it* to *should we ship it*.

That's the skill this club is built around — what [Aakash Gupta](https://www.news.aakashg.com/) calls **taste at speed**, drawn from how Boris Cherny's team builds Claude Code itself: evaluate working software fast, kill most of it, ship the few that survive. The 80% kill rate isn't failure, it's the whole point. Speed without taste just means building the wrong thing faster.

## How a build cycle runs

The old flow was linear: idea → spec → design → build → ship, over weeks. Ours is a loop:

**Idea → several divergent prototypes → evaluate → kill most → spec the survivor → hand to Kill workshop.**

The spec doesn't disappear — it moves to the *end*. It stops being a permission slip ("approve this before we build") and becomes a decision record ("we built five, here's the one we're shipping, here's why, here's when we'd pull it").

## Force divergence

The biggest trap is anchoring to the first thing that works — working software has its own gravity, it *feels* done. So when a prototype looks promising, the move is: "that's one option, now build four more." And not random variations — genuinely different approaches along a stated axis (e.g. passive vs. interactive vs. predictive). You know you've done it right when people argue about which mental model fits, not about button placement.

## How we decide: the 5 Lenses

Every prototype gets held against five lenses before it earns a kill / iterate / ship call. Each one maps to a way products quietly fail:

1. **Problem-Solution Fit** — does it solve the problem Research actually surfaced, or did it drift to an easier adjacent one?
2. **Interaction Cost** — how many steps to the value? A market tool that's slower than scanning a board loses, however clever it is.
3. **Edge Case Exposure** — what breaks on messy real postings: country-locked "remote", missing pay, junk titles, the things that sink applications?
4. **Technical Debt Signal** — is it extensible, or a demo that needs a full rebuild before the community could use it?
5. **Business Model Alignment** — does it help someone actually act on the market — land a role, hire well, price a contract — or is it just a pleasing demo?

You don't have to be an engineer to run these. You have to be willing to look at something that runs and say "this solves the wrong problem."

## Who's in it

Around five builders, kept small on purpose — small enough to align through conversation and prototypes instead of documents. Everyone builds; the judgment layer is the job, not the code. It helps to be comfortable in Claude Code, but the rarer, more valuable skill is the taste to kill your own working prototype without flinching.

## How it connects to the rest of the loop

- **Research** feeds the club raw material: what people need, what they've already built, where the market hurts.
- **AI Build Club** (here) prototypes hard, evaluates with the 5 Lenses, and brings survivors forward.
- **Kill workshop** gives every prototype a public verdict — kill / iterate / go-live — with the reason logged, so killing happens in the open and isn't personal.
- **Launch** ships the go-lives; the community uses them for real, and that feedback opens the next Research.

## How we work day to day

The repo is the team — no standups, everything async. You branch, build in `outputs/`, and save your work as a PR with a short build-log entry. Claude writes most of the code; you bring the divergence, the evaluation, and the kill calls. Every PR gets reviewed before anything ships.

---

## Want in?

There are only a handful of seats, by design. If you want to build — and you're up for killing most of what you make — reply in the channel or DM me. New to the whole thing? Start with [why this matters](vision.md), or [the Research stage](research.md) if you'd rather feed the build than do it.
