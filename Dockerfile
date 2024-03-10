FROM caddy:2.7.6-builder AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6-alpine

COPY ./caddy/Caddyfile /etc/caddy/Caddyfile

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy

