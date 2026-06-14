# How we work, and why

Worth saying upfront: this is the secondary layer. The reason to *use* the tool is the value in [vision.md](../docs/vision.md). The reason building it *this way, together* is worth your time is here, and honestly, it's the part I (Simon) am most interested in. AI-native team working is my area, and it's a big part of why I'm putting time into this. If it's not your thing, you can contribute happily without reading any further; the loop works whether or not you care about the method.

But if you do care, the bet is that you'll walk away with something portable: a way of working you can take back to your own team.

## The repo is the team

There are no standups, no sprints, and no meetings. Instead, all the context lives in this repo, so when anyone opens it their Claude already knows what the project is, how it works, and where it's up to. Coordination happens through the shared context rather than through calls. The working rule is blunt: if something matters and it isn't in the repo, it didn't happen.

## The loop

The project runs in repeating loops of four stages, and the stage is defined by who's in it rather than by a calendar:

1. **Community Research:** open to everyone. Test the tool, read the docs, interrogate the repo, and save your feedback as a PR.
2. **AI Build Club:** a small group turns that research into working features.
3. **Community Playback:** the prototypes get demoed and each one gets a public verdict (below).
4. **Community Adoption:** what survives ships, the community uses it, and that feedback opens the next loop.

## Contribution by PR, and the build log instead of standups

Everything arrives as a pull request: feedback, ideas, half-built things, "I need X" requests. Your identity rides on it automatically, so every contribution is attributed. And instead of a standup, every working session ends with a few lines in `build-log.md`: what you did, what you learned, what's open for someone else. The log is how the team stays in sync without anyone being in a room at the same time.

## Taste at speed

This leans on a point Aakash Gupta makes well: when AI makes building almost free, the scarce skill stops being "can you build it" and becomes "can you tell what's worth keeping." So the method isn't to build carefully and ship everything; it's to build a lot, fast, and then be ruthless about what survives. The building is cheap. The judgment is the work.

## Build, then validate, then kill

That judgment is a ritual, not a private call. At each Community Playback, every feature that got built gets demoed and lands in one of three buckets (kill it (a non-starter), iterate it (there's something there, it needs to work better), or take it live (it works, it ships)) and the verdict goes in the repo with the reason. Killing things in public, with stated reasons, is the method working rather than the method failing. Most of what gets built should get killed, and that's the point.

## You learn it by doing it

There's no curriculum and no course. You pick up the way of working by building inside it: opening the repo, getting oriented in minutes, shipping a small thing, seeing how the loop handles it. The benefit you walk away with is the method itself, in your hands rather than in a slide deck, ready to point at your own team's work.

## The mechanics, briefly

- **Onboarding** is meant to take minutes: clone, run `/os-start`, ask Claude what's here, open your first PR. No permission-asking, no walkthrough.
- **Milestones** get narrated to the community as they land: first outside contribution, first thing people can actually use, first honest write-up of what the method did and didn't do.
- **Progress** is visible on a shared board (and mirrored into the repo) so watchers can see where things stand without joining the build.
- **Whether it's working** is measured, not asserted. See [measures.md](measures.md).
