#!/bin/sh

# Nautilus script to start a PDF in presentation mode

for I in $@
do
	evince --presentation $I
done
exit 0
