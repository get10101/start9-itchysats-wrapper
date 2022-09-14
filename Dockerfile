FROM busybox:1.35.0-uclibc as busybox
FROM ghcr.io/itchysats/itchysats/taker:0.6.1

# Get shell and chmod so we are able to add entrypoint script and make it executable
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/chmod /bin/chmod

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
ADD ./health-check.sh /usr/local/bin/health-check.sh

# We require root access to change the entrypoint to be executable
USER root
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/health-check.sh
# Set user back to the base container user
USER 1000

VOLUME /data

EXPOSE 8000 9999 10000

# TODO: Configure the volume here and in the entrypoint
ENTRYPOINT ["docker_entrypoint.sh"]