# Fail2Ban for SSH, Nginx, and MariaDB

Fail2Ban watches logs and temporarily bans IPs that repeatedly fail
authentication or trigger known bad request patterns.

## Install

```bash
sudo apt-get update
sudo apt-get install -y fail2ban
```

## Recommended jail

Create `/etc/fail2ban/jail.d/eclipse-ot.local`:

```ini
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 5
backend = systemd

[sshd]
enabled = true
port = 22022
filter = sshd
maxretry = 3

[nginx-http-auth]
enabled = true
port = http,https
filter = nginx-http-auth
logpath = /var/log/nginx/error.log
maxretry = 5

[nginx-botsearch]
enabled = true
port = http,https
filter = nginx-botsearch
logpath = /var/log/nginx/access.log
maxretry = 2

[nginx-bad-request]
enabled = true
port = http,https
filter = nginx-bad-request
logpath = /var/log/nginx/access.log
maxretry = 5

[mysqld-auth]
enabled = true
port = 3306
filter = mysqld-auth
logpath = /var/log/mysql/error.log
findtime = 1h
maxretry = 5
bantime = 24h
```

If MariaDB logs to another path, adjust `logpath` before enabling the
`mysqld-auth` jail.

## Validate and restart

```bash
sudo fail2ban-client -t
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
sudo fail2ban-client status
```

## Inspect jails

```bash
sudo fail2ban-client status sshd
sudo fail2ban-client status nginx-http-auth
sudo fail2ban-client status nginx-botsearch
sudo fail2ban-client status nginx-bad-request
sudo fail2ban-client status mysqld-auth
```

## Unban an IP

```bash
sudo fail2ban-client set sshd unbanip <ip>
```

## Notes

- Keep SSH configured on port `22022`.
- Keep MariaDB private even with Fail2Ban enabled; Fail2Ban is defense in depth,
  not a reason to expose `3306/tcp`.
- Prefer `.local` files under `jail.d/` so package updates do not overwrite
  custom settings.
