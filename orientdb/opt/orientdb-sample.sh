#!/bin/bash

if [ ! -d /opt/orientdb/databases/GratefulDeadConcerts ]; then
	cp -r /opt/sample_databases /opt/orientdb/databases
fi

/opt/orientdb.sh