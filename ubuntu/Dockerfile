#
# Ubuntu Dockerfile with Golang, Conf.d and Etcdctl
#
# https://github.com/cleawing/dockerfiles/ubuntu
#

# Pull base image.
FROM phusion/baseimage:latest

MAINTAINER Cleawing <devops@cleawing.com>

# Install packages
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential golang ruby1.9.3 docker.io &&  \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git mc htop man unzip vim wget && \
  apt-get clean && apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /root

# Set system locale to UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Install Etcdctl
RUN \
	wget https://github.com/coreos/etcdctl/archive/v0.4.5.tar.gz && \
	tar -xzf v0.4.5.tar.gz && rm v0.4.5.tar.gz && \
	cd etcdctl-0.4.5 && ./build && \
	mv bin/etcdctl /usr/local/bin && chmod +x /usr/local/bin/etcdctl && \
	cd .. && rm -rf etcdctl-0.4.5

# Disabling SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install Conf.d
ADD https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

# Create confd directories
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates

# Set environment variables.
ENV DOCKER_HOST unix:///var/run/docker.sock
ENV ETCD_HOST 172.17.42.1:4001
ENV ETCDCTL_PEERS http://$ETCD_HOST

ENV HOME /root