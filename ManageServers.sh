#!/bin/bash

source /thirdparty/Oracle/weblogic/wlserver_10.3/server/bin/setWLSEnv.sh 2>&1 >/dev/null


java -cp /thirdparty/Oracle/weblogic/wlserver_10.3/server/lib/weblogic.jar weblogic.WLST manageServers.py -u weblogic -p password -a http://localhost:7001 -n $1 -c $2
