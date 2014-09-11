!/bin/bash

# Fail hard and fast
set -eo pipefail

# Self-publishing
etcdctl set /cleawing/services/orientdb/$CONTAINER_NAME/http $(docker port $CONTAINER_NAME 2480)
etcdctl set /cleawing/services/orientdb/$CONTAINER_NAME/binary $(docker port $CONTAINER_NAME 2424)
etcdctl set /cleawing/services/orientdb/$CONTAINER_NAME/cluster $(docker port $CONTAINER_NAME 2434)

# Onetime run of confd
confd -verbose -node=$ETCDCTL_PEERS -onetime

# smart shutdown on SIGINT and SIGTERM
function on_exit() {
    etcdctl rm --recursive /cleawing/services/orientdb/$CONTAINER_NAME
}
trap on_exit INT TERM

/opt/orientdb/bin/dserver.sh