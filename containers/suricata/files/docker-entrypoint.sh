#! /bin/sh

set -e

python3 -m idmefv2.connectors.suricata -c /etc/suricata-idmefv2.conf &

exec /usr/bin/suricata $@
