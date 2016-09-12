#!/bin/sh

for I in $@
do
	libreoffice -show $I
done
exit 0
