#!/bin/bash
chown -R nuodb:nuodb /data/nuodb
/etc/init.d/ssh start
/etc/init.d/nuoagent start
/etc/init.d/nuowebconsole start
/etc/init.d/nuoautoconsole start
/bin/bash