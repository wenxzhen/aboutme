#!/bin/bash

BI_MAVEN="192.168.6.145 mvn.csdn.net maven.csdn.net"
HOST_FILE="/C/Windows/System32/drivers/etc/hosts"

grepResult=`grep "$BI_MAVEN" "$HOST_FILE"`
if test -z "$grepResult"; then
	echo "DataService MAVEN is being used"
else
	echo "BI MAVEN is being used"	
fi



