import requests

url = "https://cdn-storage.br.de/geo/MUJIuUOVBwQIbtC2uKJDM6OhuLnC_2rH_H1S/_AES/_2F65y4G5K1S/a787f32e-8427-4351-bfef-c8b131ac5d75_HD.mp4"
res = requests.get(url, stream=True)
with open("out", "wb") as f:
    for chunk in res.iter_content(chunk_size=8192):
        f.write(chunk)
