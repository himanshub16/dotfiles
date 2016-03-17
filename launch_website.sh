#!/bin/sh
# Script to copy all files to /var/www/html to launch the current directory on localhost
# The script should run with root privileges
# Author : Himanshu Shekhar < https://github.com/himanshushekharb16/MyScripts/ >

if [ "$USER" != "root" ]; then
	echo "Please execute the script with root privileges!"
	exit 1
fi

cp * /var/www/html/ -r
rm /var/www/html/launch_site.sh
chown www-data:www-data /var/www/html -R
