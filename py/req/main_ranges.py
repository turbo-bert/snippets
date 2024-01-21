import requests

import sys
import os



print(os.path.getsize("./main_ranges.py"))

sys.exit(0)



url = "https://cdn-storage.br.de/geo.mp4"
res = requests.get(url, stream=True, headers={"Accept-Ranges": "bytes", "Range": "bytes=1000-2000"})
res.raise_for_status()

with open("out", "wb") as f:
    for chunk in res.iter_content(chunk_size=8192):
        f.write(chunk)
