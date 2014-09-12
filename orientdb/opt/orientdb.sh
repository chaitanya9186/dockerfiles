#!/bin/bash

# Fail hard and fast
set -eo pipefail

GROUP_NAME=${GROUP_NAME=dev}
GROUP_PASS=${GROUP_PASS=devpass}

# Self-publishing
etcdctl set /cleawing/services/orientdb/$CONTAINER_NAME/http $(docker port $CONTAINER_NAME 2480)
etcdctl set /cleawing/services/orientdb/$CONTAINER_NAME/binary $(docker port $CONTAINER_NAME 2424)
etcdctl set /cleawing/services/orientdb/$CONTAINER_NAME/cluster $(docker port $CONTAINER_NAME 2434)

sed -i.bak "s/GROUP_NAME/$GROUP_NAME/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak2 "s/GROUP_PASS/$GROUP_PASS/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak3 "s/CLUSTER_IP/$(docker port $CONTAINER_NAME 2434)/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak "s/CONTAINER_NAME/$CONTAINER_NAME/" /etc/confd/templates/orientdb-dserver-config.template.xml

# Set exists members from etcd
confd -verbose -node=$ETCDCTL_PEERS -onetime

# smart shutdown on SIGINT and SIGTERM
function on_exit() {
    etcdctl rm --recursive /cleawing/services/orientdb/$CONTAINER_NAME
}
trap on_exit INT TERM

/opt/orientdb/bin/dserver.sh