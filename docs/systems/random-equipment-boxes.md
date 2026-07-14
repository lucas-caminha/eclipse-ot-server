# Random Equipment Boxes

Eclipse random equipment boxes are store-delivered consumables that roll one reward when used.

## Boxes

| Item ID | Item name | Reward pool |
| --- | --- | --- |
| 60058 | cobra box | Cobra equipment |
| 60513 | cobra chest | Cobra equipment |
| 60514 | falcon chest | Falcon equipment |
| 60510 | naga chest | Naga equipment |
| 60511 | eldritch chest | Eldritch equipment |
| 60512 | lion chest | Lion equipment |
| 60523 | gnome chest | Gnome equipment |
| 60508 | monk box | Monk equipment |
| 60525 | random soul core box | Any item returned by `Game.getSoulCoreItems()` |
| 60509 | misterious bag | All Eclipse equipment pools, excluding soul cores |

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
