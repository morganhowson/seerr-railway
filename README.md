# seerr-railway

A minimal Docker wrapper for deploying [Seerr](https://seerr.dev) on [Railway](https://railway.app).

## The Problem

Seerr's official Docker image runs as the `node` user (UID 1000). Railway mounts 
volumes as root, which means the container can't write to its config directory 
(`/app/config`) and crashes on startup with an `EACCES` permission error.

## The Fix

This Dockerfile simply sets `USER root` so the container can write to the 
Railway-mounted volume. That's it.

## Usage on Railway

1. Fork or clone this repo
2. In Railway: New Service → GitHub Repo → select this repo
3. Add a volume mounted at `/app/config`
4. Set environment variables:
   - `TZ=Europe/London` (or your timezone)
   - `LOG_LEVEL=info`
5. Set port to `5055`
6. Generate a public domain and deploy

## Notes

- The base image is the official `ghcr.io/seerr-team/seerr:latest`
- Running as root inside an isolated container is acceptable for personal use
- SQLite is used by default — no database service needed
- See the [Seerr docs](https://docs.seerr.dev) for full configuration options
