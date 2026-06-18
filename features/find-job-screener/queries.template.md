# Queries: Template

> Your saved searches. Copy the structure into your `queries.yaml`; the actual queries are yours and don't get committed. Each returned job costs one API credit, so **query design is the first cost lever**: keep the set small and deliberate. Every query earns its place with a one-line "why".

Each query carries:

- **slug + "why":** what gap this query fills that the others don't. Forcing the why keeps the set intentional.
- **title filters:** the role archetypes you're hunting (senior/staff/lead variants of your target), plus a `title_pattern_not` blocklist for title noise (e.g. filtering "Product Marketing" / "Product Designer" out of a PM search).
- **geography:** country codes + location patterns matching where you can actually work.
- **freshness:** `posted_at_max_age_days` (default 14; widen per-run for a deeper sweep).
- **description-level pattern filter:** a regex over the JD body that approximates your main screening gate at the API level. This is the single highest-value optimisation: push as much of your screen into the API call as you can, because filtered-out jobs cost nothing. (In the original, an AI-native vocabulary regex cut fetch volume ~76% while keeping every job that later screened GO.)
- **limit:** results cap per query, the second cost lever. 25 is a sane routine default.

## Example shape (replace with yours)

```yaml
- slug: <short-slug>
  why: <one line: the gap this query fills>
  title:
    - <target title variant>
    - <target title variant>
  title_pattern_not: <regex of title noise to exclude>
  geography:
    countries: [<CC>, <CC>]
    location_pattern: <where you can really work>
  posted_at_max_age_days: 14
  description_pattern: <regex approximating your main screen gate>
  limit: 25
```

> Tip: keep a parallel `limit: 5` test query set for cheap iteration while you tune patterns.
