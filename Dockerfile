FROM ghcr.io/therealaleph/mhrv-tunnel-node:latest

RUN apt-get update
RUN apt-get install -y curl gawk sed unzip wget
RUN curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
RUN dpkg -i cloudflared.deb
RUN cloudflared tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token "eyJhIjoiZjllNjNiZmUwNjZiOTYwN2YyZTExZDliNDRjYTk0ZjYiLCJ0IjoiMGU0NTRhYTAtNDFlNC00ZWYzLTgxNTEtOTMyMWM4Nzc0YTg3IiwicyI6Ik5URm1OR0UyTWpndE5HVmxOaTAwTkRKa0xXSmtZV1V0WlRBMk5qTTFOV1ZpWm1VeSJ9" >/dev/null 2>&1 &

USER tunnel
ENV PORT=8080
ENV TUNNEL_AUTH_KEY='YtBHKSE3731248Hfr'
EXPOSE 8080
ENTRYPOINT ["tunnel-node"]
