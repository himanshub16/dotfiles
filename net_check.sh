#!/bin/sh
# Author : Himanshu Shekhar < https://github.com/himanshub16 >
# script to check whether the system is connected to the internet
wget -t 2 --quiet www.google.co.in 
if [ -f 'index.html' ]; then
	echo "network is up"
	rm 'index.html'
else
	echo "network is down"
fi
