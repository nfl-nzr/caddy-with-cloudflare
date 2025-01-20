ARG CADDY_VERSION=2

FROM caddy:${CADDY_VERSION}-builder AS caddy-builder

# Build caddy with cloudflare dns module and crowdsec bouncer
RUN xcaddy build \
     --with github.com/caddy-dns/cloudflare \
     --with github.com/hslatman/caddy-crowdsec-bouncer/http \
     --with github.com/caddyserver/forwardproxy

FROM caddy:${CADDY_VERSION}-alpine

# Copy caddyfile
COPY ./caddy/Caddyfile /etc/caddy/Caddyfile

# Copy caddy binary from base image
COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
