import socket
import socks
import requests

# ssh -D 127.0.0.1:8000 homer
socks.set_default_proxy(socks.PROXY_TYPE_SOCKS5, '127.0.0.1', 8000)
socket.socket = socks.socksocket

url = "https://www.heise.de/netze/tools/meine-ip-adresse"
res = requests.get(url)
ip = res.text.split("whois_query&amp;target_object=")[1].split('"')[0]
print(ip)
with open("out", "w") as f:
    f.write(ip)
