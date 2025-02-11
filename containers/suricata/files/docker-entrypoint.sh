#! /bin/sh

set -e

python3 -m idmefv2.connectors.suricata -c /etc/suricata-idmefv2.conf &

# Allow python server to start
sleep 3

exec /usr/bin/suricata $@
