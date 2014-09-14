#!/bin/bash

GROUP_NAME=${GROUP_NAME=dev}
GROUP_PASS=${GROUP_PASS=devpass}

CLUSTER=`docker port $HOSTNAME 2434`

# Prepare config
sed -i.bak "s/GROUP_NAME/$GROUP_NAME/" /etc/confd/conf.d/hazelcast.xml.toml
sed -i.bak "s/GROUP_NAME/$GROUP_NAME/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak2 "s/GROUP_PASS/$GROUP_PASS/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak3 "s/CLUSTER_IP/$CLUSTER/" /etc/confd/templates/hazelcast.template.xml
sed -i.bak "s/HOSTNAME/$HOSTNAME/" /opt/orientdb/config/orientdb-dserver-config.xml

# Wait for confd to run once and install initial templates
until confd -verbose -onetime -node $ETCDCTL_PEERS >/dev/null 2>/dev/null; do
    echo "Waiting for confd to build configs from templates..."
    sleep 1 
done

/opt/orientdb/bin/dserver.sh