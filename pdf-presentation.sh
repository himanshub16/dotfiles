#!/bin/sh

for I in $@
do
	evince --presentation $I
done
exit 0
