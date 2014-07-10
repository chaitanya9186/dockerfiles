#!/bin/bash
chown -R nuodb:nuodb /data/nuodb
/etc/init.d/ssh start
/etc/init.d/nuoagent start
/etc/init.d/nuowebconsole start
/etc/init.d/nuoautoconsole start
/bin/bash
/etc/init.d/nuoautoconsole stop
/etc/init.d/nuowebconsole stop
/etc/init.d/nuoagent stop
/etc/init.d/ssh stop
