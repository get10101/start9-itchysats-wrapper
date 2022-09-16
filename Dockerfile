FROM ghcr.io/itchysats/itchysats/taker:0.6.1 as builder

## TODO: It would be nice if we could just use our container, but we are building from distroless - which is great because it's slim, but we don't have any Linux tools in there...
## Can use busybox to copy necessary functionality in, but could not fix depednency on `dev/stdin` for the health_check
## Use bullseye instead of buster because we need glibc >2.29 available, bullseye is stable since 10.09.2022
FROM debian:bullseye-slim
COPY --from=builder /usr/bin/binary /bin/itchysats

RUN apt update && apt install -y wget
RUN wget https://github.com/mikefarah/yq/releases/download/v4.23.1/yq_linux_arm.tar.gz -O - |\
    tar xz && mv yq_linux_arm /usr/bin/yq

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
ADD ./health-check.sh /usr/local/bin/health-check.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/health-check.sh

VOLUME /data

EXPOSE 8000

ENTRYPOINT ["docker_entrypoint.sh"]
