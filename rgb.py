#image to rgb triplets
#generate RGB pixel color data from an image, for use with Tidbyt sprites
#by Kay Savetz

import sys

from PIL import Image

if len(sys.argv) <= 1:
    print("Usage: " + sys.argv[0] + " imagefile")
    exit(1)
    
img = Image.open(sys.argv[1])
print(img.format, img.size, img.mode)

for y in range(img.size[1]):
    print ("sprite.append([",end='')
    for x in range((img.size[0])):
        pixel = img.getpixel((x,y))
        if len(pixel) == 3:
            (r, g, b) = pixel
        else:
            (r, g, b, a) = pixel

        r = hex(int(r / 16))
        g = hex(int(g / 16))
        b = hex(int(b / 16))

        print ('"#' + str(r).upper()[2:] + (str(g).upper()[2:]) + (str(b)[2:].upper()) + '"', end='')
        if(x != img.size[0] -1):
            print(",",end='')
    print('])')
