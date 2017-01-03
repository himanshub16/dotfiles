#!/usr/bin/python

# Python script to directly show a file in presentation mode in libreoffice

import sys
import os

filepath = ' '.join(sys.argv[1:])

os.system("libreoffice -show \"" + filepath + "\"")
