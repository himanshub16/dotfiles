#!/bin/bash

# 0 : filename 1 : time (in seconds) 2 : columns (default value : 80) 3 : repeat (integer/no/infinite)

display_hash () {
	# $1 : number of hashes $2 : number of columns
	h=0
	s=$(($2-$1))

	if [[ $h+$s -gt $2 ]]; then
		h=$2
	fi
	# echo "hashes: $1 columns :$2"

	echo -ne "\r["
	while [[ $h -lt $1 ]]
	do
		echo -n "#"
		h=$(($h+1))
	done
	h=0
	while [[ $h -lt $s ]]
	do
		echo -n " "
		h=$(($h+1))
	done
	echo -n "] "
}

run_timer () {
	# $1 : duration (in seconds) $2 : hash per unit time (hash per second) $3 : column width
	time=$1
	hash=$2
#	echo "received $1 seconds $2 per unit time for $3 columns"
	while [[ $time -gt 0 ]]
	do
		sleep 1s
		time=$(($time-1))
		display_hash $hash $3
		hash=$(($hash+$2))
		echo -n "$time"
	done
}

beep () {
	( speaker-test -t sine -f 2000 )& pid=$! ; sleep 0.2s ; kill -9 $pid
	sleep 0.6s
}

# main

# 0 : filename 
# 1 : time (in seconds) 
# 2 : repeat (integer/no/infinite) 
# 3 : columns (default value : 80)

time=$1 col=$2

if [[ -z $col ]]; then
	col=80 
fi

if [[ -z $time ]]; then
	time=1 
fi

hash_per_sec=$(($col/$time)) t=$time

if [[ $hash_per_sec -eq 0 ]]; then
	col=$time
	hash_per_sec=1 
fi

ctr=$3 
lim=0
if [[ -z $ctr ]]; then
	ctr=1 
fi 
if [[ $ctr = "infinite" ]]; then
	echo "infinite loop to run. break with ctrl + c"
	ctr=1
	lim=-1
fi

while [[ $ctr -gt $lim ]] 
do
# 	echo "$ctr $t seconds"
	display_hash 0 $col 
	run_timer $time $hash_per_sec $col
	beep &> /dev/null
	if [[ $lim -eq -1 ]]; then
		ctr=$(($ctr+1))
	else
		ctr=$((ctr-1))
	fi
	time=$t
done

echo 
