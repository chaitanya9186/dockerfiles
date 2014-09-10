#
# Ubuntu Dockerfile with Golang, Conf.d and Etcdctl
#
# https://github.com/cleawing/dockerfiles/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER Cleawing <devops@cleawing.com>

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential golang &&  \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git mc htop man unzip vim wget && \
  apt-get clean && apt-get autoclean

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

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]