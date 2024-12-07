#!/bin/bash




#docker exec -it s3 mc alias set local http://127.0.0.1:9000 root foo12345


docker exec -it s3 mc admin accesskey create local --access-key foo --secret-key foo123foo123
