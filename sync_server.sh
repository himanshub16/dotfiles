#!/bin/sh
# Sync the current folder to localhost
# Every 30 seconds
# Avoid updating localhost html folder everytime

while [ 1 ]; do sh launch_website.sh; date;  sleep 30; done
