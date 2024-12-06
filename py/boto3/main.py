import subprocess
import boto3
import boto3.s3.transfer

# https://boto3.amazonaws.com/v1/documentation/api/latest/guide/s3.html
# https://stackoverflow.com/questions/50105094/python-upload-large-files-s3-fast

s3_akey = subprocess.check_output("whi h_s3_accesskey", shell=True, universal_newlines=True).strip().split("\n")[0].strip()
s3_skey = subprocess.check_output("whi h_s3_secretkey", shell=True, universal_newlines=True).strip().split("\n")[0].strip()

s3 = boto3.client("s3", region_name="fsn1", endpoint_url="https://fsn1.your-objectstorage.com", aws_access_key_id=s3_akey, aws_secret_access_key=s3_skey)

#s3.put_object(Bucket="turbo3", Key="TheKey", Body="""Body2""".encode())
#s3.upload_file("file.dat", "fileremote.dat", )

#help(s3.upload_file)
import threading


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

upload(s3_client=s3, filename="file.dat", bucket="turbo3", key="blobb")