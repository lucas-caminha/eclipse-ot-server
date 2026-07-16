# Prey Tiered Selection

Eclipse OT uses bestiary stars as the creature difficulty source for Prey and Hunting Task random grids.

## Difficulty Mapping

- Easy: bestiary stars `0` or `1`
- Medium: bestiary stars `2`
- Hard: bestiary stars `3`
- Challenger: bestiary stars `4` or higher

## Player Level Tiers

- Tier 1, below level `300`: 5 easy and 4 medium creatures.
- Tier 2, level `300` to `799`: 5 medium and 4 hard creatures.
- Tier 3, level `800` to `1499`: 5 hard and 4 challenger creatures.
- Tier 4, level `1500+`: 9 challenger creatures.

If the preferred tier does not have enough valid creatures after blacklist and prey eligibility checks, the grid is filled from the remaining valid preyable creatures. This keeps the client receiving up to 9 choices instead of risking an empty or stalled reroll.

## Operational Notes

- Existing active prey slots are not changed retroactively.
- The new tiered grid is generated when a slot is rerolled, expires, is reopened after being inactive, or when Hunting Task generates a new creature list.
- This is server binary behavior, so deployment requires rebuilding Canary and restarting the server.
