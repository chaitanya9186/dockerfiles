FROM ubuntu:14.04
MAINTAINER cleawing "devops@cleawing.com"

RUN apt-get update
RUN apt-get -y install redis-server
RUN sed -i 's@bind 127.0.0.1@bind 0.0.0.0@' /etc/redis/redis.conf
RUN sed -i 's@daemonize yes@daemonize no@' /etc/redis/redis.conf