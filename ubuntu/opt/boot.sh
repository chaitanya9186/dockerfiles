#!/bin/bash

# Fail hard and fast
set -eo pipefail

# Check and wait etcd cluster
until etcdctl ls /; do
	echo "[info] Waiting connect to etcd cluster..."
	sleep 1
done

# Run supervisord
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf