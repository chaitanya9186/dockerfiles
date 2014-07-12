#
# Oracle JDK7 Dockerfile
#
# https://github.com/dockerfile/jdk7
#

# Pull base image.
FROM cleawing/ubuntu

# Install Java.
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer


# Define default command.
ENTRYPOINT /usr/bin/start-hook