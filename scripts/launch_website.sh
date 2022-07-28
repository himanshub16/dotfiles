#!/bin/sh
# Script to copy all files to /var/www/html to launch the current directory on localhost
# The script should run with root privileges
# Author : Himanshu Shekhar < https://github.com/himanshub16/MyScripts/ >

if [ "$USER" != "root" ]; then
	echo "Please execute the script with root privileges!"
	exit 1
fi

read -p "Enter location from which to copy : " location
if [ "$location" = "pwd" -o "$location" = "." ]; then
	location=$(pwd)
fi
echo "$location"
# cp "$location/" /var/www/html/ -r
# chown www-data:www-data /var/www/html -R
echo "Thanks for using! :)"
