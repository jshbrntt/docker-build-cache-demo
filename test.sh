#/bin/bash

# Ensure clean initial state
docker compose down -v

# Build the image on CI/CD and cache to the registry
docker compose run --rm cicd-docker-client ./build.sh

# Build the image on the developer machine, using the cache from the registry
docker compose run --rm developer-docker-client ./build.sh

# Clean up test state
docker compose down -v
