#!/bin/bash

# Fail hard and fast
set -eo pipefail

# Onetime run of confd
confd -verbose -node=$ETCDCTL_PEERS -onetime

# Run supervisord
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf