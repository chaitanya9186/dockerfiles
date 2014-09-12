#!/bin/bash

# smart shutdown on SIGINT and SIGTERM
function on_exit() {
	until etcdctl rm --recursive /cleawing/services/orientdb/$HOSTNAME >/dev/null 2>/dev/null; do
    	sleep 1
    done
    exit 0
}
trap on_exit INT TERM

while [ 1 ]
do
	sleep 60
done

exit 0