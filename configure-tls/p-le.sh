#!/usr/bin/env sh
set -euxo pipefail

docker run -d -p 443:9443 -p 80:8000 \
    --name portainer --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    -v /etc/letsencrypt/live/portainer-gcp.bronifty.xyz:/certs/live/portainer-gcp.bronifty.xyz:ro \
    -v /etc/letsencrypt/archive/portainer-gcp.bronifty.xyz:/certs/archive/portainer-gcp.bronifty.xyz:ro \
    portainer/portainer-ce:latest \
    --sslcert /certs/live/portainer-gcp.bronifty.xyz/fullchain.pem \
    --sslkey /certs/live/portainer-gcp.bronifty.xyz/privkey.pem
