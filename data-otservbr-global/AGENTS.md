## Datapack Policy

- This is the primary Eclipse OT datapack. Keep changes compatible with Canary conventions and existing OTServBR-Global layout.
- Prefer small, grouped gameplay changes over scattered edits. New custom systems should live in predictable feature folders and be documented.
- Follow the Eclipse OT direction in `docs/customization-plan.md`: PvP-focused Brazilian audience, medium/high rates, long-term progression, boss tiers, clear requirements, cooldowns, and rewards.
- Lua scripts should be simple and efficient. Move performance-heavy or deeply integrated logic into C++ when appropriate.
- For persistent player, account, quest, boss, cooldown, or feature state, prefer KV-backed storage over legacy storage or new MySQL tables.
- When adding gameplay gates, provide clear player-facing messages for allowed, blocked, cooldown, requirement, and reward states.
- Keep migrations under `migrations/` numbered and documented. Do not modify old migrations unless the task is explicitly to repair an unreleased migration.
- Do not commit real player data, production database dumps, logs, generated map/cache artifacts, or secrets.

## Documentation

- Document new custom systems with purpose, entry points, requirements, storage/KV keys, rewards, configuration, and rollback notes.
- If a change affects deployment or operations, update the relevant docs under `docs/`.
