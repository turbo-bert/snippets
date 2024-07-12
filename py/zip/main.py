import zipfile
import io

code_file = ""
with io.StringIO() as f:
    f.write("a")
    f.write("b")
    code_file = f.getvalue()

with zipfile.ZipFile("test.zip", "w") as z:
    z.writestr("tmp/test.txt", "ich bin ein\ntest\n".encode())
    z.writestr("tmp/code_file", code_file.encode())
