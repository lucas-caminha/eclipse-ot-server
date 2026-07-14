# Random Equipment Boxes

Eclipse random equipment boxes are store-delivered consumables that roll one reward when used.

## Boxes

| Active item ID | Item name | Reward pool |
| --- | --- | --- |
| 51303 | cobra box | Cobra equipment |
| 38756 | cobra chest | Cobra equipment |
| 39396 | falcon chest | Falcon equipment |
| 37561 | naga chest | Naga equipment |
| 36980 | eldritch chest | Eldritch equipment |
| 28905 | lion chest | Lion equipment |
| 29433 | gnome chest | Gnome equipment |
| 29436 | monk box | Monk equipment |
| 30316 | random soul core box | Any item returned by `Game.getSoulCoreItems()` |
| 35479 | misterious bag | All Eclipse equipment pools, excluding soul cores |

The initially requested IDs `60058`, `60508`, `60509`, `60510`, `60511`, `60512`, `60513`, `60514`, `60523`, and `60525` are not present in the current protocol 15.11 `appearances.dat`, so Canary does not create valid item types for them. The active IDs above reuse valid protocol items and rename them as Eclipse boxes.

## Behavior

- The action is registered in `data/scripts/actions/items/reward_bags.lua`.
- On use, the system rolls one reward with equal chance when no explicit weight is set.
- The reward is added to the player's backpack when possible, otherwise to the store inbox.
- The box is consumed only after the reward is successfully delivered.
- Reward results are announced through the existing reward bag broadcast and webhook flow.

## Store

The store category is `Eclipse Boxes`, defined in `data/modules/scripts/gamestore/catalog/eclipse_boxes.lua`.

Default prices:

| Offer | Price |
| --- | --- |
| Equipment family boxes | 250 coins |
| Random Soul Core Box | 150 coins |
| Misterious Bag | 300 coins |

Adjust prices in the catalog file before deployment if the economy target changes.
