#!/bin/bash

# Fail hard and fast
set -eo pipefail

GROUP_NAME=${GROUP_NAME=dev}
GROUP_PASS=${GROUP_PASS=devpass}

PUBLIC=`docker port $HOSTNAME 2480`
BINARY=`docker port $HOSTNAME 2424`
CLUSTER=`docker port $HOSTNAME 2434`

# Self-publishing
etcdctl set /cleawing/services/orientdb/$HOSTNAME/http $PUBLIC
etcdctl set /cleawing/services/orientdb/$HOSTNAME/binary $BINARY
etcdctl set /cleawing/services/orientdb/$HOSTNAME/cluster $CLUSTER

sed -i.bak "s/GROUP_NAME/$GROUP_NAME/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak2 "s/GROUP_PASS/$GROUP_PASS/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak3 "s/CLUSTER_IP/$CLUSTER/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak "s/HOSTNAME/$HOSTNAME/" /etc/confd/templates/orientdb-dserver-config.template.xml

# Set exists members from etcd
confd -verbose -node=$ETCDCTL_PEERS -onetime

# smart shutdown on SIGINT and SIGTERM
function on_exit() {
    etcdctl rm --recursive /cleawing/services/orientdb/$HOSTNAME
}
trap on_exit INT TERM

/opt/orientdb/bin/dserver.sh