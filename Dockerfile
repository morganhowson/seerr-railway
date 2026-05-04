FROM ghcr.io/seerr-team/seerr:latest

USER root

RUN mkdir -p /app/config/logs

# Install Tailscale (Alpine)
RUN apk add --no-cache tailscale

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
