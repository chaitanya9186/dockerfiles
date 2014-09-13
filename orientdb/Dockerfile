FROM quay.io/cleawing/jdk7

MAINTAINER Cleawing <devops@cleawing.com>

ENV ORIENTDB_VERSION 1.7.8

# Build OrientDB cleaning up afterwards
RUN wget http://www.orientdb.org/portal/function/portal/download/unknown@unknown.com/-/-/-/-/-/orientdb-community-$ORIENTDB_VERSION.tar.gz/false/false/linux && \
    tar -xzf ./linux && mv ./orientdb-community-* /opt/orientdb && rm ./linux && \
    rm -rf /opt/orientdb/databases/*

# Add conf.d files
ADD ./conf.d /etc/confd/conf.d
ADD ./templates/conf.d /etc/confd/templates

# Copy orientdb-dserver-config.xml
ADD ./templates/orientdb-dserver-config.template.xml /opt/orientdb/config/orientdb-dserver-config.xml

# Copy sample database
RUN mkdir -p /opt/sample_databases
ADD ./templates/databases /opt/sample_databases

# Add Orientdb boot script
ADD ./opt/orientdb.sh /opt/orientdb.sh
ADD ./opt/orientdb-sample.sh /opt/orientdb-sample.sh
RUN chmod +x /opt/*.sh

EXPOSE 2424 2434 2480