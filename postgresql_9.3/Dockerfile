#
# example Dockerfile for http://docs.docker.com/examples/postgresql_service/
#

FROM cleawing/ubuntu

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.3``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Update the Ubuntu and PostgreSQL repository indexes
RUN apt-get update

# Copy start-hook.sh
ADD start-hook.sh /usr/bin/start-hook
RUN chmod +x /usr/bin/start-hook

# Set system locale to UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN apt-get -y -q install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 openssh-server

# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``

# Configure sshd for external access
RUN mkdir /var/run/sshd
RUN useradd -m ubuntu -s /bin/bash
RUN echo 'ubuntu:screencast' |chpasswd
RUN usermod -a -G sudo ubuntu

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN  /etc/init.d/postgresql start && sudo -u postgres psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    sudo -u postgres createdb -O docker docker

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
# USER postgres

# RUN psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
#    createdb -O docker docker

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible. 
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432
EXPOSE 22

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["data", "/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# USER root

# Set the default command to run when starting the container
ENTRYPOINT /usr/bin/start-hook
