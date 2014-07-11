#!/bin/bash
/etc/init.d/ssh start
/etc/init.d/postgresql start
/bin/bash
/etc/init.d/postgresql stop
/etc/init.d/ssh stop