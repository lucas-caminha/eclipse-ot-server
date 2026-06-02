# Install

This repo is designed to be deployed to `/opt/otserver/canary` on Ubuntu 22.04+.

## Requirements

- Ubuntu 22.04+
- MariaDB/MySQL
- CMake / Ninja / GCC toolchain required by Canary
- Canary runtime dependencies from OpenTibiaBR documentation

## First Deploy

```bash
sudo mkdir -p /opt/otserver/canary
sudo rsync -a --delete ./ /opt/otserver/canary/ \
  --exclude .git \
  --exclude config.lua \
  --exclude build \
  --exclude cache \
  --exclude data/logs
sudo cp /opt/otserver/canary/config.example.lua /opt/otserver/canary/config.lua
sudo nano /opt/otserver/canary/config.lua
```

Set at minimum:

- `ip`
- `mysqlHost`
- `mysqlUser`
- `mysqlPass`
- `mysqlDatabase`

## Build

Follow the official OpenTibiaBR/Canary build docs for the exact dependency flow. Keep compiled artifacts out of Git.

## Systemd

Use `infra/systemd/canary.service.example` as reference.
