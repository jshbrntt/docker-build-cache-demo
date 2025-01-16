# Test Dockerfile for multi-stage builds

# gamma -> beta -> alpha
FROM busybox:latest AS alpha

ARG SEED="The quick brown fox jumps over the lazy dog"

COPY src/alpha.txt /tmp/alpha.txt

# artifical delay to simulate a long running build
RUN sleep 2

RUN echo -n "$SEED" | sha1sum | awk '{print $1}' > /tmp/hash-alpha.txt

FROM busybox:latest AS beta

COPY src/beta.txt /tmp/beta.txt

COPY --from=alpha /tmp/hash-alpha.txt /tmp/hash-alpha.txt

# artifical delay to simulate a long running build
RUN sleep 2

RUN cat /tmp/hash-alpha.txt | sha1sum | awk '{print $1}' > /tmp/hash-beta.txt

FROM busybox:latest AS gamma

COPY src/gamma.txt /tmp/gamma.txt

COPY --from=beta /tmp/hash-beta.txt /tmp/hash-beta.txt

# artifical delay to simulate a long running build
RUN sleep 2

RUN cat /tmp/hash-beta.txt | sha1sum | awk '{print $1}' > /tmp/hash-gamma.txt
