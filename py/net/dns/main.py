import socket
from rich.pretty import pprint as PP
import ipaddress


def defuse_ipv4(src):
    cols = src.split(".")
    res = "%d.%d.%d.%d" % (
        int(cols[0]),
        int(cols[1]),
        int(cols[2]),
        int(cols[3])
    )
    return res


y = defuse_ipv4("8.8.8.8")

addr = ipaddress.ip_address(y)

host_name, host_aliassses, host_adresslist = socket.gethostbyaddr(y)
PP(y)
PP(host_name)
