#!/bin/sh

set -e

#configurator
# TODO: Handle the configurator

# Make sure the container has permissions to write into the directory that was mounted to the /data volume
chown -R 1000:1000 /data

exec /usr/bin/binary --data-dir=/data --http-address=0.0.0.0:8000 mainnet --electrum=electrs.embassy:50001
