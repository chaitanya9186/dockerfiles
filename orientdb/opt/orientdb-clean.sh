#!/bin/bash

if [ -d /opt/orientdb/databases/GratefulDeadConcerts ]; then
	rm -rf /opt/orientdb/GratefulDeadConcerts
fi

/opt/orientdb.sh