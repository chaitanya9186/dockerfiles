#
# Oracle JRE7 Dockerfile
#
# https://github.com/dockerfile/jdk7
#

# Pull base image.
FROM cleawing/ubuntu

# Install Java.
RUN \
  echo 'deb http://www.duinsoft.nl/pkg debs all' >> /etc/apt/sources.list && \
  apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26 && apt-get update && \
  wget http://www.duinsoft.nl/pkg/pool/all/update-sun-jre.bin && \
  chmod +x update-sun-jre.bin && ./update-sun-jre.bin && \
  rm ./update-sun-jre.bin 

# Define default command.
ENTRYPOINT /usr/bin/start-hook