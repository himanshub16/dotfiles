# generate thumbnail of image

# source : stackoverflow.com/questions/2612436

import os, sys
import Image

size = 350, 400 

for infile in sys.argv[1:]:
	outfile = os.path.splitext(infile)[0]+"-thumbnail"+os.path.splitext(infile)[1]
	if infile != outfile :
		try:
			im = Image.open (infile)
			im.thumbnail(size)
			im.save(outfile, "JPEG")
		except IOError:
			print "cannot create thumbnail for ", infile


