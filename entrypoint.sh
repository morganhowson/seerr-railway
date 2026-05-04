#!/bin/sh
set -e

# Start tailscaled in the background
tailscaled --tun=userspace-networking --statedir=/var/lib/tailscale &

# Wait for the socket
sleep 2

# Authenticate
tailscale up \
  --authkey="${TS_AUTHKEY}" \
  --advertise-tags=tag:container \
  --hostname=seerr-railway \
  --accept-routes

echo "Tailscale up, starting Seerr..."

# Start Seerr
exec node /app/dist/index.js
