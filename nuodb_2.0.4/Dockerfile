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
EXPOSE 48004 48005 48006 4807
EXPOSE 8080
EXPOSE 8888
EXPOSE 8889

# Copy start-hook.sh
ADD start-hook.sh /usr/bin/start-hook
RUN chmod +x /usr/bin/start-hook

# Define default command.
ENTRYPOINT /usr/bin/start-hook