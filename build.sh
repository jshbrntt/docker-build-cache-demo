#/bin/bash

# wait for docker host to be ready
while ! docker info &>/dev/null; do sleep 1; done

# build the image
docker buildx build \
--push \
--tag nexus:5000/app \
--cache-to type=registry,ref=nexus:5000/app-cache,mode=max \
--cache-from type=registry,ref=nexus:5000/app-cache \
.
