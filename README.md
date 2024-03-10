## Caddy with cloudflare dns module.

Proxy server with cloudflare dns module support

### Requirements
- Docker v20.10+

### Setup
#### Pull base image
```bash
docker pull ghcr.io/nfl-nzr/caddyflare:0.1
```
### Env 
```bash
export DOMAIN=<Domain>
export CF_TOKEN=<Cloudflare token>
export PROXY_ADDR=<Server to proxy requests to>
```
#### Run container
```bash
docker run -d nfl-nzr/caddyflare:latest
```
