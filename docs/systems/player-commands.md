# Player Commands

Eclipse OT exposes a small quality-of-life command set for normal players.

## Commands

| Command | Purpose |
| --- | --- |
| `!commands` | Lists available commands and descriptions for the player's group. |
| `!fps` | Safely reconnects the character when the client FPS feels stuck. Blocked in fight, PZ lock, or white skull. |
| `!uptime` | Shows how long the current server process has been online. |
| `!rates` | Shows the player's current staged experience, skill, magic, loot, and spawn rates. |
| `!rewards` | Shows the configured level milestone rewards. |
| `!bosses` | Shows current boss progression guidance and points players to related commands. |
| `!frags` | Shows unjustified kill count, skull time, and red skull limits. |
| `!online` | Shows online players grouped by active, idle, and training state. |
| `!serverinfo` | Shows detailed rates, PvP limits, world type, and server save time. |
| `!reward` | Claims the one-time exercise weapon reward. |
| `!aol` | Buys an amulet of loss using the bank balance. |
| `!bless` | Buys all available blessings. |
| `!refill` | Refills supported charge items using silver tokens. |

## Lootpouch Buyer

`data-otservbr-global/npc/lootpouch_buyer.lua` registers a `Lootpouch Buyer`
NPC using the validated `LootShopConfig` and `LootShopConfigTable` from
`data/scripts/lib/shops.lua`.

The NPC is intentionally a separate revscript so it can be spawned where the
map team wants it without duplicating the large loot list.
