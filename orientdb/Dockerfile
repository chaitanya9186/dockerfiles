FROM cleawing/jdk7

MAINTAINER Cleawing <devops@cleawing.com>

ENV ORIENTDB_VERSION 1.7.8

# Build OrientDB cleaning up afterwards
RUN wget http://www.orientdb.org/portal/function/portal/download/unknown@unknown.com/-/-/-/-/-/orientdb-community-$ORIENTDB_VERSION.tar.gz/false/false/linux && \
    tar -xzf ./linux && mv ./orientdb-community-* /opt/orientdb && rm ./linux && \
    rm -rf /opt/orientdb/databases/*

ADD ./supervisord/orientdb.conf /etc/supervisor/conf.d/orientdb.conf
EXPOSE 2424 2480