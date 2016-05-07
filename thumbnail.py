# generate thumbnail of image

# source : stackoverflow.com/questions/2612436

import os, sys
import Image

size = 128, 128

for infile in sys.argv[1:]:
	outfile = os.path.splitext(infile)[0]+".thumbnail"
	if infile != outfile :
		try:
			im = Image.open (infile)
			im.thumbnail(size)
			im.save(outfile, "JPEG")
		except IOError:
			print "cannot create thumbnail for ", infile


