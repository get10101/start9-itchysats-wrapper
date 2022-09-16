#!/bin/sh

set -e

ITCHYSATS_USER=itchysats
ITCHYSATS_PASSWORD=$(yq e '.password' /root/start9/config.yaml)

# Properties page for username and password
echo "version: 2
data:
  ItchySats Username:
    type: string
    value: \"$ITCHYSATS_USER\"
    description: The username for ItchySats
    copyable: true
    masked: false
    qr: false
  ItchySats Password:
    type: string
    value: \"$ITCHYSATS_PASSWORD\"
    description: The password for ItchySats.
    copyable: true
    masked: true
    qr: false
" >> /root/start9/stats.yaml

exec itchysats --data-dir=/data --http-address=0.0.0.0:8000 --password=$ITCHYSATS_PASSWORD mainnet --electrum=electrs.embassy:50001
