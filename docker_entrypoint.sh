#!/bin/sh

set -e

#configurator
# TODO: Handle the configurator

exec itchysats --data-dir=/data --http-address=0.0.0.0:8000 mainnet --electrum=electrs.embassy:50001
