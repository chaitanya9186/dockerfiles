FROM dockerfile/ubuntu
MAINTAINER Cleawing <devops@cleawing.com>

# Let's get serf
RUN wget https://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip
RUN unzip 0.6.3_linux_amd64.zip
RUN rm -f 0.6.3_linux_amd64.zip
RUN cp serf /usr/bin/

ADD /start-serf.sh /usr/bin/start-serf.sh
RUN chmod 755 /usr/bin/start-serf.sh

EXPOSE 7946 7373
CMD ["/usr/bin/start-serf.sh"]