def imgfun():
    import PIL
    import PIL.Image
    import PIL.ImageDraw
    width_px = 2100
    height_px = 2970
    _cm = float(2100.0/21.0)
    img = PIL.Image.new("RGB", (width_px, height_px), "white")
    draw = PIL.ImageDraw.Draw(img)
    draw.line([[10*_cm,10*_cm], [15*_cm,10*_cm]], fill="black", width=int(0.1*_cm))
    img.save("test.png", format="PNG")
