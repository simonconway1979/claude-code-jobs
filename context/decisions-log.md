# Decisions log

Every consequential call, dated, with the reason. Playback verdicts (kill / iterate / go-live) land here too. Killed features stay listed with their reasons. Transparency is the method.

| Date | Decision | Why |
|---|---|---|
| 2026-06-12 | Repo starts private, flips public at first shipped artefact | Ease of administration at ~6 collaborators; branch protection is free once public |
| 2026-06-12 | All contribution by PR, never to main | Attribution, reviewability, and nothing breaks that one revert can't fix |
| 2026-06-12 | Seed product: job-search pipeline (sanitised) | Warm start: a working system on day one, chosen with the community 2026-06-09 |
| 2026-06-12 | Value leads, method follows | People join for what the project's worth, not how the team works; the team-OS layer is a real benefit but it's secondary and stays behind the value |
| 2026-06-12 | Four-stage loop, defined by who's in it | Research → Build Club → Playback → Adoption, repeating; the stage isn't time-boxed, it's whoever's currently engaged. Gives watchers a legible cycle and contributors a stage-matched orientation |
| 2026-06-12 | Two audiences kept distinct | A small team (~6) builds firsthand; the wider community watches, uses, and feeds back. Avoids trying to coordinate hundreds while a handful do the deep work |
| 2026-06-12 | Build → validate → kill in public | Every built feature gets a public verdict at Playback with its reason logged; most things should get killed, and killing them openly is the method, not a failure |
| 2026-06-12 | Sanitisation rule | The repo teaches how the system works and carries the operating context, never anyone's personal job-search data, private career strategy, API keys, or raw community messages |
