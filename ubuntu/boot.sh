#!/bin/bash

# Fail hard and fast
set -eo pipefail

# Initial run of confd
confd -verbose -node=$ETCDCTL_PEERS -onetime

# Run supervisord
/usr/bin/supervisord