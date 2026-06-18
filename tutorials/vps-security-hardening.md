# VPS security hardening for Eclipse OT

This tutorial documents the baseline security setup for the production VPS that
runs Canary, MyAAC, Nginx, MariaDB, and the login services.

## Goals

- Keep only public services reachable from the Internet.
- Keep MariaDB private to the VPS.
- Preserve SSH access on the custom production port.
- Keep the game, website, and HTTPS ports available.
- Make changes reversible and easy to audit.

## Production ports

Allow these inbound ports:

| Port | Purpose |
| ---- | ------- |
| `22022/tcp` | SSH administration |
| `80/tcp` | HTTP/Nginx |
| `443/tcp` | HTTPS/Nginx |
| `7171/tcp` | Canary login protocol |
| `7172/tcp` | Canary game protocol |
| `7173/tcp` | Canary status protocol, if enabled |

Do not expose `3306/tcp` publicly. MariaDB should be reachable locally by
Canary/MyAAC only.

## UFW setup

Install UFW if needed:

```bash
sudo apt-get update
sudo apt-get install -y ufw
```

Apply the baseline rules:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22022/tcp comment 'SSH admin'
sudo ufw allow 80/tcp comment 'HTTP'
sudo ufw allow 443/tcp comment 'HTTPS'
sudo ufw allow 7171/tcp comment 'Canary login'
sudo ufw allow 7172/tcp comment 'Canary game'
sudo ufw allow 7173/tcp comment 'Canary status'
sudo ufw --force enable
sudo ufw status verbose
```

## Verify listening services

```bash
sudo ss -ltnp | grep -E ':22022|:80|:443|:7171|:7172|:7173|:3306' || true
```

Expected:

- SSH is listening on `22022`.
- Nginx is listening on `80` and optionally `443`.
- Canary is listening on game/login/status ports.
- MariaDB may listen on `127.0.0.1:3306` or a local socket, but should not be
  publicly reachable.

## Common checks

```bash
sudo systemctl status canary nginx php8.2-fpm mariadb --no-pager
sudo journalctl -u canary -n 80 --no-pager
sudo ufw status numbered
```

## Rollback

If a UFW rule is wrong, list numbered rules and delete only the incorrect one:

```bash
sudo ufw status numbered
sudo ufw delete <number>
```

If the firewall itself must be disabled during emergency recovery:

```bash
sudo ufw disable
```
