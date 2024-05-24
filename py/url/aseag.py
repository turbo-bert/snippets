import urllib
import urllib.parse

von = "VON"
nach = "NACH"

x = """{document.getElementById("Inputgen_From").value="%s";document.getElementById("Inputgen_To").value="%s";}""" % (von, nach)
print("javascript:(function()%s)()" % (urllib.parse.quote(x)))
