# Canary logs and healthcheck

This tutorial collects the daily commands used to inspect production health:
service state, open ports, resources, and recent logs.

## One-shot healthcheck script

Install as `/opt/scripts/status-canary.sh`:

```bash
#!/usr/bin/env bash
set -euo pipefail

printf '== Services ==\n'
systemctl --no-pager --full status canary nginx php8.2-fpm mariadb | sed -n '1,120p'

printf '\n== Ports ==\n'
ss -ltnp | grep -E ':80|:443|:7171|:7172|:7173|:22022|:3306' || true

printf '\n== Firewall ==\n'
ufw status verbose || true

printf '\n== Fail2Ban ==\n'
fail2ban-client status || true

printf '\n== Resources ==\n'
free -h
df -h /

printf '\n== Recent Canary Logs ==\n'
journalctl -u canary -n 60 --no-pager

printf '\n== Recent Nginx Errors ==\n'
tail -n 40 /var/log/nginx/error.log 2>/dev/null || true

printf '\n== Recent MariaDB Logs ==\n'
journalctl -u mariadb -n 40 --no-pager 2>/dev/null || true
```

Then:

```bash
sudo chmod 750 /opt/scripts/status-canary.sh
sudo /opt/scripts/status-canary.sh
```

## Canary logs

```bash
sudo journalctl -u canary -f
sudo journalctl -u canary -n 120 --no-pager
sudo journalctl -u canary --since '1 hour ago' --no-pager
```

## Systemd state

```bash
sudo systemctl status canary --no-pager
sudo systemctl show canary -p Restart -p RestartUSec -p NRestarts
sudo systemctl reset-failed canary
```

## Port checks

```bash
sudo ss -ltnp | grep -E ':7171|:7172|:7173|:8088|:80|:443|:22022|:3306' || true
```

## Useful interpretation

- `Active: active (running)` means the service is up.
- `Active: inactive (dead)` after Server Save usually means the process exited
  cleanly and systemd did not restart it. Use `Restart=always`.
- `Start request repeated too quickly` means systemd hit the restart limit.
  Read recent logs, fix the cause, then run `systemctl reset-failed canary`.
- MariaDB should not be exposed publicly even if it is listening locally.
