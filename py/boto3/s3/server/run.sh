#!/bin/bash



rm -fr data
mkdir data

#MINIO_ROOT_USER
#MINIO_ROOT_PASSWORD

docker run --rm --name s3 -p 9000:9000 -p 9001:9001 -v `pwd`/data:/data -d -e MINIO_ROOT_USER=root -e MINIO_ROOT_PASSWORD=foo12345 minio/minio server /data --console-address ":9001"

docker logs -f s3
