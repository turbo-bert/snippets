import PIL
import PIL.Image


x = PIL.Image.open("build.scad.png").convert("RGB")
print(x.size)
px = x.load()
