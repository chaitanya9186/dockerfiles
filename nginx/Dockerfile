#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM cleawing/ubuntu

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/etc/nginx/sites-available", "/etc/nginx/conf.d", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Expose the ports we're interested in
EXPOSE 80
EXPOSE 443

# Copy start-hook.sh
ADD start-hook.sh /usr/bin/start-hook
RUN chmod +x /usr/bin/start-hook

# Define default command.
ENTRYPOINT /usr/bin/start-hook