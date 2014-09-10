#!/bin/bash

# Fail hard and fast
set -eo pipefail

# Run confd
confd -node=$ETCDCTL_PEERS -interval=$CONFD_INTERVAL