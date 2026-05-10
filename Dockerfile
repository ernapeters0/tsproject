FROM ghcr.io/therealaleph/mhrv-tunnel-node:latest As app

FROM cloudflare/cloudflared:latest AS cloudflared

FROM app
COPY --from=cloudflared /usr/local/bin/cloudflared /usr/local/bin/cloudflared
COPY entry_point.sh /entry_point.sh
RUN chmod +x /entry_point.sh
USER tunnel
ENV PORT=8080
ENV TUNNEL_AUTH_KEY='YtBHKSE3731248Hfr'
EXPOSE 8080
ENTRYPOINT ["/entry_point.sh"]
