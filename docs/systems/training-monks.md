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

## Operations

After deploying the monster file, load it without restarting Canary:

```text
/reload monsters
```

The command requires a God character and `allowReload = true`.
