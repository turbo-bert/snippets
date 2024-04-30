from hcloud import Client
import os

token = open(os.path.expanduser("~/some/where"), 'r').read().split("\n")[0].strip()
client = Client(token=token)


servers = client.servers.get_all()
for s in servers:
    print(f"{s.id}/{s.name}/{s.status}")
