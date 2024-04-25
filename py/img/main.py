import sys
import PIL
import PIL.Image
#import turbodinwriter
import math


# scale a picture to q square box

def sqboxed(imgfilename, mm):
    img = PIL.Image.open("build.scad.png")#.convert("RGB")
    w_px, h_px = img.size

    if w_px == h_px:
        return (float(mm),float(mm))

    if w_px > h_px:
        w_px_divby_mm = float(w_px) / float(mm)
        h_related = float(math.floor(h_px/w_px_divby_mm))
        return (float(mm),float(h_related))

    if w_px < h_px:
        h_px_divby_mm = float(h_px) / float(mm)
        w_related = float(math.floor(w_px/h_px_divby_mm))
        return (float(w_related),float(mm))


w_mm, h_mm = sqboxed("build.scad2.png", 50)

print(w_mm)
print(h_mm)

sys.exit(0)
