FROM busybox:ubuntu-14.04

MAINTAINER Cleawing <devops@cleawing.com>

RUN mkdir -p /opt/orientdb/databases && mkdir -p /opt/orientdb/config && mkdir -p /opt/orientdb/config/cert

# Copy demo database
ADD databases /opt/orientdb/databases

# Copy config files
ADD config /opt/orientdb/config

VOLUME /opt/orientdb/config
VOLUME /opt/orientdb/databases