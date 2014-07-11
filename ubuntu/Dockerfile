#
# Ubuntu Dockerfile
#
# https://github.com/unitymind/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential openssh-server && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get clean && apt-get autoclean

# Set system locale to UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/scripts /root/scripts

# Configure sshd for external access
RUN mkdir /var/run/sshd
RUN useradd -m ubuntu -s /bin/bash
RUN echo 'ubuntu:screencast' |chpasswd
RUN usermod -a -G sudo ubuntu

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Expose the ports we're interested in
EXPOSE 22

# Copy start-hook.sh
ADD start-hook.sh /usr/bin/start-hook
RUN chmod +x /usr/bin/start-hook

# Define default command.
ENTRYPOINT /usr/bin/start-hook