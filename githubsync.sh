#!/bin/sh
# Sync your current repo with github, standard and novice way
# Commit to master branch
# Author : Himanshu Shekhar < https://github.com/himanshushekharb16 >

# read -p "Enter directory location to sync with github : " dirname
# cd $dirname
git add -A
read -p "Enter any commit message (if any) : " commsg
git commit -m $commsg
git push -u origin master
