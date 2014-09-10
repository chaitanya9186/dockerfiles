#
# Oracle Java 7 Dockerfile
#
# https://github.com/cleawing/dockerfiles/jdk7

# Pull base image.
FROM cleawing/ubuntu

MAINTAINER Cleawing <devops@cleawing.com>

# Install Java.
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  apt-get clean && apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*