#!/bin/sh

set -e

#configurator
# TODO: Handle the configurator

exec /usr/bin/binary mainnet --electrum=tcp://electrs.embassy
