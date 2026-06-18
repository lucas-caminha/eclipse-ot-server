# Canary auto-restart with systemd

This tutorial configures the Canary service to start again whenever the server
process exits, including after a Server Save that stops the process cleanly.

## Why use `Restart=always`

`Restart=on-failure` only restarts the service when the process exits with an
error, receives an unclean signal, or times out. If Canary exits with status `0`
after a Server Save, systemd treats that as a clean stop and may leave it down.

Use `Restart=always` when the desired behavior is:

- Canary crashes: start it again.
- Canary is killed unexpectedly: start it again.
- Canary exits cleanly after Server Save: start it again.

## Service file

Create or edit `/etc/systemd/system/canary.service`:

```ini
[Unit]
Description=Canary OpenTibia Server
After=network.target mariadb.service
StartLimitIntervalSec=300
StartLimitBurst=10

[Service]
Type=simple
User=canary
Group=canary
WorkingDirectory=/opt/otserver/canary
ExecStart=/opt/otserver/canary/canary
Restart=always
RestartSec=5
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
```

## Apply the change

```bash
sudo systemctl daemon-reload
sudo systemctl enable canary
sudo systemctl restart canary
sudo systemctl status canary
```

## Watch logs

```bash
sudo journalctl -u canary -f
```

## Test auto-restart

This simulates the process disappearing:

```bash
sudo systemctl kill canary
sleep 8
sudo systemctl status canary
```

The service should return to `active (running)` automatically.

## If systemd stops retrying

If the server fails too many times in a short period, systemd can place it in a
failed state because of `StartLimitIntervalSec` and `StartLimitBurst`.

After fixing the underlying issue, reset the failure counter:

```bash
sudo systemctl reset-failed canary
sudo systemctl start canary
```

## Useful production commands

```bash
sudo systemctl status canary
sudo systemctl restart canary
sudo journalctl -u canary -n 80 --no-pager
```
