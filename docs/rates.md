# Progression Rates

Eclipse OT uses staged experience, skill, and magic-level rates. Stages are
enabled with `rateUseStages = true` and configured in `data/stages.lua`.

## Experience

The experience curve is intentionally generous through approximately level
600, then slows progressively without a single severe rate drop.

| Level | Rate |
| --- | ---: |
| 1-50 | 800x |
| 51-100 | 720x |
| 101-150 | 640x |
| 151-200 | 560x |
| 201-250 | 480x |
| 251-300 | 400x |
| 301-350 | 330x |
| 351-400 | 270x |
| 401-450 | 220x |
| 451-500 | 180x |
| 501-550 | 145x |
| 551-600 | 115x |
| 601-650 | 90x |
| 651-700 | 70x |
| 701-750 | 55x |
| 751-800 | 42x |
| 801-850 | 32x |
| 851-900 | 23x |
| 901-950 | 15x |
| 951-999 | 9x |
| 1000+ | 5x |

`lowLevelBonusExp` is set to `0` so the advertised `800x` starting rate is not
silently increased by another 50%. Stamina, scheduled events, VIP bonuses, and
other explicit boosts can still modify final experience gain.

## Combat Skills

Skills remain fast through 100 and become progressively harder afterward.

| Skill level | Rate |
| --- | ---: |
| 0-50 | 30x |
| 51-70 | 25x |
| 71-85 | 20x |
| 86-100 | 15x |
| 101-110 | 10x |
| 111-120 | 7x |
| 121-130 | 5x |
| 131+ | 3x |

## Magic Level

Magic level has its own curve because its progression cost differs from combat
skills.

| Magic level | Rate |
| --- | ---: |
| 0-50 | 15x |
| 51-75 | 12x |
| 76-90 | 9x |
| 91-100 | 7x |
| 101-110 | 5x |
| 111-120 | 4x |
| 121+ | 3x |

## Applying Changes

Rate stages are loaded at server startup. After changing `data/stages.lua` or
the rate settings in `config.lua`, restart Canary and inspect the startup log:

```bash
sudo systemctl restart canary
sudo journalctl -u canary -n 80 --no-pager
```

Players can use the server-info talkaction to inspect the stage that currently
applies to their level and skills.
