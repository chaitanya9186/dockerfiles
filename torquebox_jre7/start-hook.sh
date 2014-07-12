#!/bin/bash
/etc/init.d/ssh start
sudo -u torquebox /opt/torquebox/jboss/bin/standalone.sh -b 0.0.0.0
/etc/init.d/ssh stop