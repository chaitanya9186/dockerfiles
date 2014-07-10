#!/bin/bash
/etc/init.d/nuoagent start
/etc/init.d/nuowebconsole start
chown -R nuodb:nuodb /data/nuodb
/bin/bash