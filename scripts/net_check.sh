#!/bin/sh
# Author : Himanshu Shekhar < https://github.com/himanshub16 >
# script to check whether the system is connected to the internet
outputfile=`mktemp /tmp/netcheck.sh.XXXX` || exit 1

wget -t 2 --quiet www.google.co.in -O $outputfile
if [ -f $outputfile ]; then
	echo "network is up"
	rm $outputfile
else
	echo "network is down"
fi
