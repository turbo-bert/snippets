import sys
import PIL
import PIL.Image
import math

import PIL.ImageColor


img = PIL.Image.new("RGB", (100,100), (255,255,255))

# (0,0) is top left
for i in range(0,100):
    img.putpixel((i,i), (0,0,255))
img.save("test.png", "PNG")

sys.exit(0)
