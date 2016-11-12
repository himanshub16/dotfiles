#!/usr/bin/python

import shutil
import os
import sys
import random
import string
from copy import copy # don't want pass by reference sometimes

TARGET_DIRECTORY = os.getcwd()
MAX_LEVELS = 0
WORDS_LIST = []
FILE_EXTENSIONS = [ 'txt', 'mp3', 'odt', 'ods', 'jpeg', 'png', \
					'gif', 'mkv','avi','mp4', 'm4a', 'tiff', 'ppt' \
					'doc', 'docx', 'sh', 'cpp', 'c', 'py', 'java' ]

def random_extension():
	return random.choice(FILE_EXTENSIONS)

# def random_word(length):
# 	return ''.join(random.choice(string.lowercase) for i in range(length))

# this function works on linux only
# for windows, and random strings, uncomment above function
def read_words():
	dictionary_file = "/usr/share/dict/words"
	global WORDS_LIST
	with open(dictionary_file, 'r') as f:
		WORDS_LIST = f.readlines()
	WORDS_LIST = [ w.strip().replace('\'', '').replace('\\','') for w in WORDS_LIST if len(w) > 10 ]


def random_word(length):
	return random.choice(WORDS_LIST)


def random_filename():
	return (random_word(random.randint(20, 30)) + '.' + random_extension())


def random_dirname():
	return random_word(random.randint(20, 30))


def make_directories(target, dmin, dmax, fmin, fmax, size_min, size_max, level):
	if (level >= MAX_LEVELS):
		print 'Level exceeded at', target
		return 
	# number of directories to make
	dir_count = random.randint(dmin, dmax+1)
	print "LEVEL", level, "Creating", dir_count, "directories at", target
	while (dir_count > 0):
		try:
			new_path = os.path.join(target, random_dirname())
			os.makedirs(new_path)
			# make files
			file_count = random.randint(fmin, fmax+1)
			print "Creating", file_count, "files at", new_path
			while (file_count > 0):
				with (open(os.path.join(new_path, random_filename()), 'w')) as f:
						f.write(random_word(random.randint(size_min, size_max)))
				file_count -= 1

			make_directories(new_path, dmin, dmax, fmin, fmax, size_min, size_max, copy(level+1))
			dir_count -= 1

		except OSError as e:
			print "Error", e
			pass
	


def main():
	try:
		os.mkdir(TARGET_DIRECTORY)
	except OSError:
		if os.path.isdir(TARGET_DIRECTORY):
			choice = raw_input("Directory with same name exists, remove that (y/n) ? ")
			print choice
			if choice == 'y':
				shutil.rmtree(TARGET_DIRECTORY)
				os.mkdir(TARGET_DIRECTORY)
			else:
				sys.exit()

	global MAX_LEVELS
	MAX_LEVELS = int(raw_input("Enter maximum depth to reach : "))
	fmin = int(raw_input("Enter number of files per directory (min) : "))
	fmax = int(raw_input("Enter number of files per directory (max) : "))
	dmin = int(raw_input("Enter number of directories per directory (min) : "))
	dmax = int(raw_input("Enter number of directories per directory (max) : "))
	size_min = int(raw_input("Minimum size of file (in characters) : "))
	size_max = int(raw_input("Maximum size of file (in characters) : "))

	read_words()
	make_directories(TARGET_DIRECTORY, dmin, dmax, fmin, fmax, size_min, size_max, 1)
	# creating a zip archive of the entire mess created
	zipfile = shutil.make_archive(TARGET_DIRECTORY, 'zip', TARGET_DIRECTORY)
	print 
	print 
	print 'Files are created at', TARGET_DIRECTORY
	print 'A zipfile has been made', zipfile
	print 'Ready to hide the needle in the haystack'



if __name__ == "__main__":
	print "Keep the depth as low as possible"
	print "Maximum 2^depth directories are created"
	main()
