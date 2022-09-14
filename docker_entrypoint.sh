#!/bin/sh

set -e

#configurator
# TODO: Handle the configurator

exec ITCHYSATS_ENV=start9 tini -- taker mainnet --electrum=tcp://electrs.embassy
