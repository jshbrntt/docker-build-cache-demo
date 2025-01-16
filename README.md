# `docker-build-cache-demo`

## Requirements

-   Docker

## Getting Started

1.  Run `./test.sh`.

1.  Observe the **Docker image** being built by the **CI/CD** client.

1.  Observe that the `cache` is being stored on the registry.

1.  Observe that when the **Docker image** is built by the **Developer** client, that it reuses the `cache` from the `registry`.
