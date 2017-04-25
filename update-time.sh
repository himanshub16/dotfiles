#!/bin/bash
# Update system time from ...
# Google, not NTP servers

# Source: http://askubuntu.com/questions/81293/what-is-the-command-to-update-time-and-date-from-internet 

sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"

sudo hwclock --systohc

echo "Done"
