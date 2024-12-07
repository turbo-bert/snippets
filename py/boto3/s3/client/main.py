import threading
import boto3
import boto3.s3.transfer
from rich.pretty import pprint as PP

# https://boto3.amazonaws.com/v1/documentation/api/latest/guide/s3.html
# https://stackoverflow.com/questions/50105094/python-upload-large-files-s3-fast

s3_akey = "foo"
s3_skey = "foo123foo123"

s3 = boto3.client("s3", region_name="fsn1", endpoint_url="http://127.0.0.1:9000", aws_access_key_id=s3_akey, aws_secret_access_key=s3_skey)


bucketnames = [ "bucket-%d" % x for x in range(1,100)]

# https://boto3.amazonaws.com/v1/documentation/api/1.35.6/reference/services/s3/client/create_bucket.html

# for b in bucketnames:
#     print(b)
#     s3.create_bucket(ACL='private', Bucket=b)

#PP(s3.list_buckets()["Buckets"])



def s3_getbucketnames(s3_client):
    res = [ x['Name'] for x in s3_client.list_buckets()["Buckets"]]
    return res


def upload(s3_client, filename, bucket, key):
    txbytes = 0
    lock = threading.Lock()

    def progress(chunk_size):
        nonlocal txbytes
        nonlocal lock
        with lock:
            txbytes+=chunk_size
            print("\r%d MB " % int(txbytes/1024/1024), end="")
    
    config = boto3.s3.transfer.TransferConfig(multipart_threshold=10*1024*1024)
    s3_client.upload_file(Filename=filename, Bucket=bucket, Key=key, ExtraArgs=None, Callback=progress, Config=config)

#upload(s3_client=s3, filename="file.dat", bucket="test", key="blobb")


y = s3_getbucketnames(s3)

import sys
for b in y:
    res = s3.list_objects(Bucket=b)
    if "Contents" in res.keys():
        obs = res["Contents"]
        filenames = list(map(lambda x: {"Key": x["Key"]}, obs))
        s3.delete_objects(Bucket=b, Delete={"Objects":filenames})
    s3.delete_bucket(Bucket=b)
