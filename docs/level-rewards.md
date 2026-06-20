# Level Rewards

New characters start at level 20 with the configured first-items kit in
`data/scripts/creaturescripts/player/send_first_items.lua`.

The `LevelRewards` creature event grants milestone rewards once per character
using player KV keys under `level-rewards`. Item rewards are delivered to the
Store Inbox. Mounts and outfits are learned directly by the character.

Equipment rewards intentionally stop at level 350 with Umbral items. Later
power tiers such as Falcon, Eldritch, Soul, Sanguine, Spiritthorn, and
Arcanomancer are reserved for other game systems and store boxes.

## Common Rewards

| Level | Rewards |
| --- | --- |
| 50 | 5 crystal coins, Donkey mount |
| 100 | 10 crystal coins, Citizen outfit |
| 150 | 15 crystal coins |
| 200 | 20 crystal coins, Armoured War Horse mount |
| 250 | powerful vampirism scroll |
| 275 | powerful strike scroll, 27 crystal coins |
| 300 | powerful void scroll, 30 crystal coins |

## Vocation Rewards

| Vocation | Level | Rewards |
| --- | --- | --- |
| Master Sorcerer | 250 | Summoner outfit |
| Master Sorcerer | 350 | umbral master spellbook |
| Elder Druid | 250 | Druid outfit |
| Elder Druid | 350 | umbral master spellbook |
| Royal Paladin | 250 | Hunter outfit |
| Royal Paladin | 350 | umbral master bow, umbral master crossbow |
| Elite Knight | 250 | Knight outfit |
| Elite Knight | 350 | highest melee skill reward: umbral masterblade, umbral master axe, or umbral master mace |
| Exalted Monk | 250 | Monk outfit |
| Exalted Monk | 350 | umbral master katar |
