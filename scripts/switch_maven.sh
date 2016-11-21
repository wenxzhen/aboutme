#!/bin/bash

set echo on

SP_MAVEN="192.168.4.201 mvn.csdn.net maven.csdn.net"
BI_MAVEN="192.168.6.145 mvn.csdn.net maven.csdn.net"

HOST_FILE="/C/Windows/System32/drivers/etc/hosts"

M2_HOME="/c/Users/zhengwx/.m2/"
SP_SETTINGS="settings_sp.xml"
BI_SETTINGS="settings_bi.xml"
DST_SETTINGS="settings.xml"

grepResult=`grep "$BI_MAVEN" "$HOST_FILE"`
if test -z "$grepResult"; then
	echo "DataService MAVEN is being used"
	
	# here, we need to use " instead of '
	sed -i "s/$SP_MAVEN/$BI_MAVEN/g" $HOST_FILE
	cp -f $M2_HOME$BI_SETTINGS $M2_HOME$DST_SETTINGS
	echo "Done: Change to BI MAVEN"
else
	echo "BI MAVEN is being used"
	
	# here, we need to use " instead of '
	sed -i "s/$BI_MAVEN/$SP_MAVEN/g" $HOST_FILE
	cp -f $M2_HOME$SP_SETTINGS $M2_HOME$DST_SETTINGS
	echo "Done: Change to SP MAVEN"
fi



