# Use the latest ubuntu with Oracle JDK 7
FROM cleawing/java7

ENV NUODB_VERSION 2.0.4

# Instal the NuoDB distribution using .deb package
RUN cd /opt &&  \
  wget http://download.nuohub.org/nuodb-$NUODB_VERSION.linux.x64.deb && \ 
  dpkg -i nuodb-$NUODB_VERSION.linux.x64.deb && \
  rm nuodb-$NUODB_VERSION.linux.x64.deb

# Enable service nuowebconsole as default
RUN update-rc.d nuowebconsole enable

# Make datadir
RUN mkdir -p /data/nuodb

# Define mountable directories.
VOLUME ["/data/nuodb"]

# Expose the ports we're interested in
EXPOSE 48004
EXPOSE 8080

ADD start-db.sh /usr/bin/start-nuodb
RUN chmod +x /usr/bin/start-nuodb

# Set the default command to run on boot
# This will run NuodDB Broker and Console as services
ENTRYPOINT /usr/bin/start-nuodb
