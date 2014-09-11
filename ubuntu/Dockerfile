#
# Ubuntu Dockerfile with Golang, Conf.d and Etcdctl
#
# https://github.com/cleawing/dockerfiles/ubuntu
#

# Pull base image.
FROM ubuntu:14.04.1

MAINTAINER Cleawing <devops@cleawing.com>

ENV DOCKER_HOST 172.17.42.1
ENV ETCD_HOST $DOCKER_HOST:4001
ENV ETCDCTL_PEERS http://$ETCD_HOST
ENV CONFD_INTERVAL 30

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Install packages
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential golang docker.io &&  \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git mc htop man unzip vim wget supervisor && \
  apt-get clean && apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*

# Set system locale to UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Install Etcdctl
RUN \
	wget https://github.com/coreos/etcdctl/archive/v0.4.5.tar.gz && \
	tar -xzf v0.4.5.tar.gz && rm v0.4.5.tar.gz && \
	cd etcdctl-0.4.5 && ./build && \
	mv bin/etcdctl /usr/local/bin && chmod +x /usr/local/bin/etcdctl && \
	cd .. && rm -rf etcdctl-0.4.5

# Install Conf.d
ADD https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

# Create directories
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates

RUN mkdir -p /etc/supervisor/conf.d
RUN mkdir -p /var/log/supervisor 

# Add supervisord config
ADD ./supervisord/supervisord.conf /etc/supervisor/supervisord.conf

# Add confd supervisord file
ADD ./supervisord/confd.conf /etc/supervisor/conf.d/confd.conf

# Add conf.d script
ADD ./opt/confd.sh /opt/confd.sh
RUN chmod +x /opt/confd.sh

# Add boot script
ADD ./opt/boot.sh /opt/boot.sh
RUN chmod +x /opt/boot.sh

# Define default command.
CMD /opt/boot.sh