#!/usr/bin/python

# Script to generate random files in a directory
# Each file comprise of random size within a range
# Is made to be used in an event in college fest at IIITA

import random, string
import os, sys
import shutil

def randomword(length):
	return ''.join(random.choice(string.lowercase) for i in range(length))

try:
	os.mkdir("target-directory")
except OSError:
	if os.path.isdir('target-directory'):
		choice = raw_input("folder with name target-directory exists. remove that (y/n) ?")
		print choice
		if choice == "y":
			shutil.rmtree('target-directory')
			os.mkdir('target-directory')
		else:
			sys.exit()


n = int(raw_input("Enter number of files to create : "))
length = int(raw_input("Enter length of string to write (>5): "))

for i in range(n):
	with open("target-directory/file-" + str(i), 'w') as f:
		f.write(randomword(random.randint(length-5, length)))

print "Job done"

