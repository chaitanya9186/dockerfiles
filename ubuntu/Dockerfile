#
# Ubuntu Dockerfile with Conf.d
#
# https://github.com/cleawing/dockerfiles/ubuntu
#

# Pull base image.
FROM dockerfile/ubuntu

MAINTAINER Cleawing <devops@cleawing.com>

# Set system locale to UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

ADD https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd