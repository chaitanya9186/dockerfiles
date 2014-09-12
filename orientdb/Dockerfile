FROM quay.io/cleawing/jdk7

MAINTAINER Cleawing <devops@cleawing.com>

ENV ORIENTDB_VERSION 1.7.8

# Build OrientDB cleaning up afterwards
RUN wget http://www.orientdb.org/portal/function/portal/download/unknown@unknown.com/-/-/-/-/-/orientdb-community-$ORIENTDB_VERSION.tar.gz/false/false/linux && \
    tar -xzf ./linux && mv ./orientdb-community-* /opt/orientdb && rm ./linux && \
    rm -rf /opt/orientdb/databases/*

# Add conf.d files
ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates

# Copy orientdb-dserver-config.xml
ADD ./templates/orientdb-dserver-config.template.xml /opt/orientdb/config/orientdb-dserver-config.xml

# Add Orientdb boot script
RUN mkdir -p /etc/service/orientdb
ADD ./runit.d/orientdb.sh /etc/service/orientdb/run
RUN chmod +x /etc/service/orientdb/run
ADD ./boot.sh /opt/boot.sh
RUN chmod +x /opt/boot.sh

EXPOSE 2424 2434 2480