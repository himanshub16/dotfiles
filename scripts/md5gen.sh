# md5gen.sh : Bash script (not sh)
# Script to generate md5sum of a given number of strings and append them to a file "md5file"
# Useful when you are hosting some quiz and want the answers to be hashed.
# Author : Himanshu Shekhar < https://github.com/himanshub16 >
read  -p "Enter number of strings: " n

fname='md5file'
#read  -p "Enter filename for output : " fname

read -p "Enter any remarks for this record : " rem

if [[ ! -f "$fname" ]]; then
	read -p "File does not exist ! Create new file? (y/n) : " choice
	if [[ $choice = 'y' ]]; then
		touch "$fname"
	else
		exit 1
	fi
fi
echo "$rem" >> $fname
i=0
while [[ $i -lt $n ]];
	do
		read -p "$(($i+1)) " ip
		echo -n "$(($i+1)) " >> $fname
		echo -n "$ip" > tempfile
		md5sum tempfile | cut -f1 -d' '  >> $fname
		i=$(($i+1))
	done

echo "" >> $fname
rm tempfile
