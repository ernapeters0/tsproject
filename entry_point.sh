#!/bin/bash
apt-get update && apt-get install -y curl gawk sed unzip wget net-tools bzip2
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && dpkg -i cloudflared.deb

nohup cloudflared tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token "eyJhIjoiZjllNjNiZmUwNjZiOTYwN2YyZTExZDliNDRjYTk0ZjYiLCJ0IjoiMGU0NTRhYTAtNDFlNC00ZWYzLTgxNTEtOTMyMWM4Nzc0YTg3IiwicyI6Ik5URm1OR0UyTWpndE5HVmxOaTAwTkRKa0xXSmtZV1V0WlRBMk5qTTFOV1ZpWm1VeSJ9" >/dev/null 2>&1 &
sleep 5
curl -sS http://ip-api.com/json --preproxy socks5://127.0.0.1:8086
