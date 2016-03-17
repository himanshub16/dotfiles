# MyScripts
Scripts to automate most common tasks that I perform in daily life. Yeah, like a SysAdmin, automate and stay lazy. :P
---------------------------------------------------------------------------------------

# launch_site.sh
Usage : sh launch_site.sh
Purpose : Copies all the contents of current directory (where the script is present, except itsef) to /var/www/html. Just a simple way to host a website. This is required to avoid development of website on the go, or as root.

# set_brightness.sh
Usage : sh set_brightness.sh
Purpose : Sets the system brightness right from the terminal. Useful for headless servers. :) Supported for intel_backlight only. :(

# net_check.sh
Usage : sh net_check.sh
Purpose : Checks whether your connection to the internet is alive or not. Not a ping based, it actually checks for a download.

# proxy_check.sh
Usage : bash proxy_check.sh
Purpose : Checks current system proxy configuration on a Debian/Ubuntu System.

# md5gen.sh
Usage : bash md5gen.sh
Purpose : Generate md5sum of a given number of strings and append them to a file. Useful when trying to create a record of hashed strings.

# githubsync.sh
Usage : sh githubsync.sh
Purpose : Sync your local repo with github, very novice and lame method. For syncing with master branch only.

# update.sh
Usage : sh update.sh
Purpose : Keep your system updated by downloading the available updates/upgrades from the repos
