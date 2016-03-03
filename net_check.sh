#!/bin/sh
# do not use sh
wget -t 2 --quiet www.google.co.in 
if [ -f 'index.html' ]; then
	echo "network is up"
	rm 'index.html'
else
	echo "network is down"
fi

