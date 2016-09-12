#!/bin/sh
# Nautilus script to start a presentation without opening LibreOffice and click on start presentation

for I in $@
do
	libreoffice -show $I
done
exit 0
