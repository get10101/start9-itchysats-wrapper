FROM ghcr.io/itchysats/itchysats/taker:0.6.1 as builder

## TODO: It would be nice if we could just use our container, but we are building from distroless - which is great because it's slim, but we don't have any Linux tools in there...
## Can use busybox to copy necessary functionality in, but run into trouble when trying to access e.g. `dev/stdin` for the health_check
## Use bullseye because we need glibc >2.29 available
FROM debian:bullseye-slim
COPY --from=builder /usr/bin/binary /bin/itchysats

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
ADD ./health-check.sh /usr/local/bin/health-check.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/health-check.sh

VOLUME /data

EXPOSE 8000 9999 10000

# TODO: Configure the volume here and in the entrypoint
ENTRYPOINT ["docker_entrypoint.sh"]