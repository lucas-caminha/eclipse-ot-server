# World Map Assets

The production OpenTibiaBR global map file is intentionally not committed to this repository because it is larger than GitHub's regular file limit.

Current production map path:

```text
/opt/otserver/canary/data-otservbr-global/world/otservbr.otbm
```

Expected deploy path:

```text
data-otservbr-global/world/otservbr.otbm
```

## How To Restore On A Server

Use one of these sources:

1. Copy the file from the production VPS backup.
2. Download the official map artifact referenced by Canary/OpenTibiaBR releases.
3. Use Git LFS later if we decide to version map binaries.

After restoring the map file, restart Canary:

```bash
sudo systemctl restart canary
sudo journalctl -u canary -n 40 --no-pager
```
