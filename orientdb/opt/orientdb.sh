#!/bin/bash

# Fail hard and fast
set -eo pipefail

GROUP_NAME=${GROUP_NAME=dev}
GROUP_PASS=${GROUP_PASS=devpass}

# Self-publishing
etcdctl set /cleawing/services/orientdb/$HOSTNAME/http $(docker port $HOSTNAME 2480)
etcdctl set /cleawing/services/orientdb/$HOSTNAME/binary $(docker port $HOSTNAME 2424)
etcdctl set /cleawing/services/orientdb/$HOSTNAME/cluster $(docker port $HOSTNAME 2434)

sed -i.bak "s/GROUP_NAME/$GROUP_NAME/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak2 "s/GROUP_PASS/$GROUP_PASS/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak3 "s/CLUSTER_IP/$(docker port $CONTAINER_NAME 2434)/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak "s/HOSTNAME/$HOSTNAME/" /etc/confd/templates/orientdb-dserver-config.template.xml

# Set exists members from etcd
confd -verbose -node=$ETCDCTL_PEERS -onetime

# smart shutdown on SIGINT and SIGTERM
function on_exit() {
    etcdctl rm --recursive /cleawing/services/orientdb/$HOSTNAME
}
trap on_exit INT TERM

/opt/orientdb/bin/dserver.sh