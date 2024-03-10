FROM caddy:2.7.6-builder AS caddy-builder

# Build caddy with cloudflare dns module
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6-alpine

# Copy caddyfile
COPY ./caddy/Caddyfile /etc/caddy/Caddyfile

# Copy caddy binary from base image
COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
