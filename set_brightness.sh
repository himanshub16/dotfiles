#!/bin/sh
# Author : Himanshu Shekhar < https://github.com/himanshushekharb16 >
# script to set system brightness (current support for intel_backlight only
# useful for headless servers

if [ "$USER" != "root" ]; then
	echo "DO RUN THE PROGRAM AS sudo / root!"
	exit 1
fi

max_br="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
read -p "Enter brightness (integer value only) (1-$max_br) " br
if [ "$br" -gt "$max_br" ]; then
	echo "Invalid input!"
	echo "Please retry!"
	exit 1
elif [ "$br" -lt "1" ]; then
	echo "Invalid input!"
	echo "Please retry!"
	exit 1
fi

echo "$br" > /sys/class/backlight/intel_backlight/brightness

echo "Thanks for using!"

