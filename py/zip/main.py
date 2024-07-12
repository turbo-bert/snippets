import zipfile

with zipfile.ZipFile("test.zip", "w") as z:
    z.writestr("/tmp/test/test.txt", "ich bin ein\ntest\n".encode())
