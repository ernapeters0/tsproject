FROM ghcr.io/therealaleph/mhrv-tunnel-node:1.9.10

WORKDIR /app
COPY . .

USER tunnel
ENV PORT=8080
ENV TUNNEL_AUTH_KEY='YtBHKSE3731248Hfr'
EXPOSE 8080
ENTRYPOINT ["./entry_point.sh"]
