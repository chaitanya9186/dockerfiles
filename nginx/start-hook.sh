#!/bin/bash
/etc/init.d/ssh start
/etc/init.d/nginx start
/bin/bash
/etc/init.d/nginx stop
/etc/init.d/ssh stop