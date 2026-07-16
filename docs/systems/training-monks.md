# Training Monks

`Training Monk` is a custom target monster intended for trainer map areas.

## Behavior

- 100,000 maximum health.
- Heals 5,000-10,000 health every second.
- Uses the Dark Monk outfit (`lookType 225`).
- Deals at most 8 melee damage, matching the Rat's configured maximum attack.
- Grants no experience and drops no loot.
- Cannot be summoned, convinced, pushed, or have its outfit changed.
- Is immune to paralyze, invisibility, and outfit changes.

The monster type is defined in `data-otservbr-global/monster/custom/training_monk.lua`.
Spawn positions must be supplied by the trainer map or spawn XML.

## Trainer Room Teleports

The custom trainer package at `D:\otserver\maps-custom\Custom\Trainers.zip\Trainers`
uses Training Monk spawns in this approximate area:

- `x = 1141..1181`
- `y = 1038..1058`
- `z = 4..9`

`data-otservbr-global/scripts/custom/movement_trainer_exit.lua` handles trainer room
exits without requiring Action IDs on every teleport tile. Magic forcefields (`1949`)
and vortexes (`28673`) inside that area teleport the player to their town temple when
stepped on.

## Operations

After deploying the monster file, load it without restarting Canary:

```text
/reload monsters
```

The command requires a God character and `allowReload = true`.
