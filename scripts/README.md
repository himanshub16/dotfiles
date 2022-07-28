# MyScripts
Scripts to automate most common tasks that I perform in daily life. Yeah, like a SysAdmin, automate and stay lazy. :P
---------------------------------------------------------------------------------------

## show-presentation.sh
Usage : Place it to your Nautilus scripts directory (~/.local/share/nautilus/scripts/)

Purpose : This adds a menu entry to your file manager (Nautilus) on Linux that lets you start any file for presentation in Full Screen using LibreOffice. 


## pdf-presentation.sh
Usage : Place it to your Nautilus scripts directory (~/.local/share/nautilus/scripts/)

Purpose : This adds a menu entry to your file manager (Nautilus) on Linux that lets you start any PDF file for presentation in Full Screen using Evince.

## stopwatch.sh
Usage : bash timer.sh

Purpose : This is a countdown timer impolemented in bash. Has features like column width of output, sound type, and number of iterations of timer

## beep
Usage : sh beep

Purpose : Makes a beep sound like alarm clock

## thumbnail.py
Usage : python thumbnail.py imagefilename

Purpose : Generates thumbnail of any image using PIL (Python Imaging Library)

## launch_website.sh
Usage : sh launch_site.sh

Purpose : Copies all the contents of current directory (where the script is present, except itsef) to /var/www/html. Just a simple way to host a website. This is required to avoid development of website on the go, or as root.

## set_brightness.sh
Usage : sh set_brightness.sh

Purpose : Sets the system brightness right from the terminal. Useful for headless servers. :) Supported for intel_backlight only. :(

## net_check.sh
Usage : sh net_check.sh

Purpose : Checks whether your connection to the internet is alive or not. Not a ping based, it actually checks for a download.

## proxy_check.sh
Usage : bash proxy_check.sh

Purpose : Checks current system proxy configuration on a Debian/Ubuntu System.

## md5gen.sh
Usage : bash md5gen.sh

Purpose : Generate md5sum of a given number of strings and append them to a file. Useful when trying to create a record of hashed strings.

## githubsync.sh
Usage : sh githubsync.sh

Purpose : Sync your local repo with github, very novice and lame method. For syncing with master branch only.

## update.sh
Usage : sh update.sh

Purpose : Keep your system updated by downloading the available updates/upgrades from the repos
