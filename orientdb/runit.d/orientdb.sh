#!/bin/bash

GROUP_NAME=${GROUP_NAME=dev}
GROUP_PASS=${GROUP_PASS=devpass}

PUBLIC=`docker port $HOSTNAME 2480`
BINARY=`docker port $HOSTNAME 2424`
CLUSTER=`docker port $HOSTNAME 2434`

# Self-publishing
etcdctl set /cleawing/services/orientdb/$HOSTNAME/http $PUBLIC
etcdctl set /cleawing/services/orientdb/$HOSTNAME/binary $BINARY
etcdctl set /cleawing/services/orientdb/$HOSTNAME/cluster $CLUSTER

# Prepare config
sed -i.bak "s/GROUP_NAME/$GROUP_NAME/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak2 "s/GROUP_PASS/$GROUP_PASS/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak3 "s/CLUSTER_IP/$CLUSTER/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak "s/HOSTNAME/$HOSTNAME/" /opt/orientdb/config/orientdb-dserver-config.xml

# Wait for confd to run once and install initial templates
until confd -verbose -onetime -node $ETCDCTL_PEERS >/dev/null 2>/dev/null; do
    echo "Waiting for confd to write initial templates..."
    sleep 1 
done

/opt/orientdb/bin/dserver.sh