# GeoIP and Cloudflare firewall rules

Status: tutorial only. Do not apply blindly.

This procedure was reported as tested in production on Linux Ubuntu 24.04.
The setup assumes Cloudflare proxies ports `80` and `443`, while Canary game
ports remain exposed directly.

The goal is:

- Accept HTTP/HTTPS traffic only from Cloudflare IP ranges.
- Keep Canary ports `7171` and `7172` reachable.
- Block TCP traffic to `7171` and `7172` from outside the Americas with GeoIP.
- Add basic flood and connection-limit rules for the game ports.
- Log GeoIP and flood detections for later inspection.

## Install dependencies

Update the operating system package index:

```bash
sudo apt update
```

Install required packages:

```bash
sudo apt install xtables-addons-common libtext-csv-xs-perl libgeo-ip-perl -y
```

## Prepare GeoIP database

Create the GeoIP database directory:

```bash
sudo mkdir -p /usr/share/xt_geoip
```

Download or place `dbip-country-lite.csv` in the working directory, then build
the GeoIP files:

```bash
sudo /usr/libexec/xtables-addons/xt_geoip_build -D /usr/share/xt_geoip dbip-country-lite.csv
```

Verify whether the module is loaded:

```bash
lsmod | grep xt_geoip
```

If the command returns nothing, load the module manually:

```bash
sudo modprobe xt_geoip
```

## Install the firewall script

Copy the script to:

```text
/usr/local/bin/firewall-rules.sh
```

Then make it executable:

```bash
sudo chmod +x /usr/local/bin/firewall-rules.sh
```

Add this line to root's crontab so the rules are restored after reboot:

```cron
@reboot bash /usr/local/bin/firewall-rules.sh
```

Edit root's crontab with:

```bash
sudo crontab -e
```

## firewall-rules.sh

```bash
#!/usr/bin/env bash

sleep 60

# Cloudflare IPs - HTTPS and HTTP
for ip in 131.0.72.0/22 172.64.0.0/13 104.24.0.0/14 104.16.0.0/13 \
          162.158.0.0/15 198.41.128.0/17 197.234.240.0/22 188.114.96.0/20 \
          190.93.240.0/20 108.162.192.0/18 141.101.64.0/18 103.31.4.0/22 \
          103.22.200.0/22 103.21.244.0/22 173.245.48.0/20; do
    iptables -A INPUT -p tcp --dport 443 -s "$ip" -j ACCEPT
    iptables -A INPUT -p tcp --dport 80 -s "$ip" -j ACCEPT
done

# [ACCEPT] Main Tibia ports
iptables -A INPUT -p tcp --dport 7171 -j ACCEPT
iptables -A INPUT -p tcp --dport 7172 -j ACCEPT

# [DROP] GeoIP outside the Americas
iptables -I INPUT -p tcp --dport 7171 -m geoip ! --source-country BR,AR,CL,CO,MX,US,CA,UY,PE,VE,BO,EC,PY,GT,HN,NI,SV,CR,PA,DO,CU,HT,JM,TT -j DROP
iptables -I INPUT -p tcp --dport 7172 -m geoip ! --source-country BR,AR,CL,CO,MX,US,CA,UY,PE,VE,BO,EC,PY,GT,HN,NI,SV,CR,PA,DO,CU,HT,JM,TT -j DROP

# [FLOOD] DDoS protection with recent
iptables -I INPUT -p tcp --dport 7171 -m state --state NEW -m recent --set --name tibia7171
iptables -I INPUT -p tcp --dport 7171 -m state --state NEW -m recent --update --seconds 10 --hitcount 10 --name tibia7171 -j DROP
iptables -I INPUT -p tcp --dport 7172 -m state --state NEW -m recent --set --name tibia7172
iptables -I INPUT -p tcp --dport 7172 -m state --state NEW -m recent --update --seconds 10 --hitcount 10 --name tibia7172 -j DROP

# [LIMIT] Simultaneous connections per IP
iptables -I INPUT -p tcp --dport 7171 -m connlimit --connlimit-above 5 --connlimit-mask 32 -j REJECT --reject-with tcp-reset
iptables -I INPUT -p tcp --dport 7172 -m connlimit --connlimit-above 5 --connlimit-mask 32 -j REJECT --reject-with tcp-reset

# [LOG] Attack detection
iptables -I INPUT -p tcp --dport 7171 -m recent --update --seconds 10 --hitcount 10 --name tibia7171 -j LOG --log-prefix "DDoS 7171 DETECTED: "
iptables -I INPUT -p tcp --dport 7172 -m recent --update --seconds 10 --hitcount 10 --name tibia7172 -j LOG --log-prefix "DDoS 7172 DETECTED: "

# [LOG] GeoIP before blocking
iptables -I INPUT -p tcp --dport 7171 -m geoip ! --source-country BR,AR,CL,CO,MX,US,CA,UY,PE,VE,BO,EC,PY,GT,HN,NI,SV,CR,PA,DO,CU,HT,JM,TT -j LOG --log-prefix "GeoIP BLOCK 7171: "
iptables -I INPUT -p tcp --dport 7172 -m geoip ! --source-country BR,AR,CL,CO,MX,US,CA,UY,PE,VE,BO,EC,PY,GT,HN,NI,SV,CR,PA,DO,CU,HT,JM,TT -j LOG --log-prefix "GeoIP BLOCK 7172: "
```

## View blocked addresses

```bash
dmesg | grep 'DDoS 7172 DETECTED\|GeoIP BLOCK'
```

To inspect both game ports:

```bash
dmesg | grep 'DDoS 7171 DETECTED\|DDoS 7172 DETECTED\|GeoIP BLOCK'
```

## Cautions

- This tutorial uses raw `iptables`; review interaction with UFW before applying
  on a production VPS that already has UFW enabled.
- Cloudflare IP ranges can change. Check Cloudflare's current published ranges
  before relying on this for `80` and `443`.
- Blocking outside the Americas can prevent legitimate players abroad from
  connecting.
- Test from an existing SSH session before closing your terminal.
