import urllib
import urllib.parse

x = """{//javascript for firefox bookmark;}"""
print("javascript:(function()%s)()" % (urllib.parse.quote(x)))
