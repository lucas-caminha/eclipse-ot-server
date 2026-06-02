# Eclipse OT Server

Canary/OpenTibiaBR server base and customizations for **Eclipse OT**.

This repository tracks the server-side code, datapack, safe configuration examples, operations scripts and documentation. Production secrets and runtime artifacts are intentionally excluded.

## Base

- Upstream: `opentibiabr/canary`
- Base commit currently deployed: `979ff35aa3d7ee4edb3ae2ad3f6cf5999d6c3dcb`
- Canary version observed at runtime: `3.5.0`
- Protocol: `15.11`

## Current Identity

- Server name: `Eclipse OT`
- MOTD: `Welcome to Eclipse OT. Rise through the darkness.`
- World type: PvP
- Datapack: `data-otservbr-global`
- Rates: exp `20`, skill `20`, magic `10`, loot `3`, spawn `2`

## What Is Not Committed

Do not commit:

- production `config.lua`
- database password
- SSH keys
- compiled `canary` binary
- `build/`, `cache/`, logs
- player/account database dumps
- backups with real data

Use `config.example.lua` as the starting point for deployments.

## Useful Docs

- [Install](docs/install.md)
- [Operations](docs/operations.md)
- [Changelog](docs/changelog.md)
- [Customization Plan](docs/customization-plan.md)
- [World Map Assets](docs/world-map.md)
