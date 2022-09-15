#!/bin/sh

set -e

ITCHYSATS_USER=itchysats
ITCHYSATS_PASSWORD=$(yq e '.password' /root/start9/config.yaml)

# Properties Page
echo 'version: 2' > /root/start9/stats.yaml
echo 'data:' >> /root/start9/stats.yaml
echo '  ItchySats Username:' >> /root/start9/stats.yaml
echo '    type: string' >> /root/start9/stats.yaml
echo '    value: "'"$ITCHYSATS_USER"'"' >> /root/start9/stats.yaml
echo '    description: The username for ItchySats' >> /root/start9/stats.yaml
echo '    copyable: true' >> /root/start9/stats.yaml
echo '    masked: false' >> /root/start9/stats.yaml
echo '    qr: false' >> /root/start9/stats.yaml
echo '  ItchySats Password:' >> /root/start9/stats.yaml
echo '    type: string' >> /root/start9/stats.yaml
echo '    value: "'"$ITCHYSATS_PASSWORD"'"' >> /root/start9/stats.yaml
echo '    description: The password for ItchySats.' >> /root/start9/stats.yaml
echo '    copyable: true' >> /root/start9/stats.yaml
echo '    masked: true' >> /root/start9/stats.yaml
echo '    qr: false' >> /root/start9/stats.yaml

exec itchysats --data-dir=/data --http-address=0.0.0.0:8000 --password=$ITCHYSATS_PASSWORD mainnet --electrum=electrs.embassy:50001
