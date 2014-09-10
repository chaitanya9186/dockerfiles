#!/bin/bash

# Fail hard and fast
set -eo pipefail

# Onetime run of confd with waiting of connection to etcd cluster
until confd -verbose -node=$ETCDCTL_PEERS -onetime; do
	echo "[info] Waiting connect to etcd cluster..."
	sleep 1
done

# Run supervisord
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
