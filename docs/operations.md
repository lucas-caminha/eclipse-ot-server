# Operations

## Production Paths

- Server root: `/opt/otserver/canary`
- Config: `/opt/otserver/canary/config.lua`
- Binary: `/opt/otserver/canary/canary`
- Service: `canary.service`
- Scripts: `/opt/scripts`

## Common Commands

```bash
sudo systemctl status canary
sudo systemctl restart canary
sudo journalctl -u canary -n 80 --no-pager
```

## Backup

The VPS currently uses `/opt/scripts/backup-canary.sh` for daily backups. Backup outputs must not be committed.

## After Config Changes

```bash
sudo systemctl restart canary
sudo journalctl -u canary -n 40 --no-pager
```
