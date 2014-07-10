# Use the latest ubuntu with Oracle JDK 7
FROM cleawing/java7

ENV NUODB_VERSION 2.0.4

# Instal the NuoDB distribution using .deb package
RUN cd /opt &&  \
  wget http://download.nuohub.org/nuodb-$NUODB_VERSION.linux.x64.deb && \ 
  dpkg -i nuodb-$NUODB_VERSION.linux.x64.deb && \
  rm nuodb-$NUODB_VERSION.linux.x64.deb
  
# Install sshd for external access
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN useradd -m ubuntu -s /bin/bash
RUN echo 'ubuntu:screencast' |chpasswd
RUN usermod -a -G sudo ubuntu

# Enable service nuowebconsole as default
RUN update-rc.d nuowebconsole enable

# Make datadir
RUN mkdir -p /data/nuodb

# Define mountable directories.
VOLUME ["/data/nuodb"]

# Expose the ports we're interested in
EXPOSE 48004 48005 48006 4807
EXPOSE 8080
EXPOSE 8888
EXPOSE 8889
EXPOSE 22

ADD start-hook.sh /usr/bin/start-hook
RUN chmod +x /usr/bin/start-hook

# Set the default command to run on boot
# This will run NuodDB Broker and Console as services
ENTRYPOINT /usr/bin/start-hook
