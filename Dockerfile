# TODO: Read rust version from toolchain file in itchysats/
FROM rust:1.63-slim AS builder

ARG VERSION

WORKDIR /itchysats

RUN apt-get update
RUN apt-get install -y git clang cmake libsnappy-dev

COPY ./itchysats .
# Copy git dir so that vergen can read the itchtysats module version upon installation
# TODO: Can be removed once vergen is removed
COPY ./.git ./../.git

# Install the taker binary
RUN cargo install --locked --path ./taker/

FROM debian:buster-slim

RUN apt update && apt install -y bash curl tini wget
RUN wget https://github.com/mikefarah/yq/releases/download/v4.23.1/yq_linux_arm.tar.gz -O - |\
    tar xz && mv yq_linux_arm /usr/bin/yq

COPY --from=builder /usr/local/cargo/bin/taker /bin/taker

# TODO: Deal with configurator
#ADD ./configurator/target/aarch64-unknown-linux-musl/release/configurator /usr/local/bin/configurator
ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
ADD health-check.sh /usr/local/bin/health-check.sh
RUN chmod a+x /usr/local/bin/health-check.sh

WORKDIR /data

# ItchySats HTTP interface
EXPOSE 8000

# TODO: shall we expose that for ItchySats?
# Prometheus monitoring
#EXPOSE 4224

STOPSIGNAL SIGINT

ENTRYPOINT ["docker_entrypoint.sh"]