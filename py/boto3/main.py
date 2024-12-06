import subprocess
import boto3


s3_akey = subprocess.check_output("whi h_s3_accesskey", shell=True, universal_newlines=True).strip().split("\n")[0].strip()
s3_skey = subprocess.check_output("whi h_s3_secretkey", shell=True, universal_newlines=True).strip().split("\n")[0].strip()

s3 = boto3.client("s3", region_name="fsn1", endpoint_url="https://fsn1.your-objectstorage.com", aws_access_key_id=s3_akey, aws_secret_access_key=s3_skey)

s3.put_object(Bucket="turbo3", Key="TheKey", Body="""Body2
""".encode())
