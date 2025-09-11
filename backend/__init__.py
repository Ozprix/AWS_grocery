import boto3
from flask import request, jsonify

s3_client = boto3.client('s3', region_name='eu-central-1')

def upload_avatar(file):
    bucket_name = 'aws-grocery-avatars-V1'
    filename = f"avatar_{uuid.uuid4().hex}.jpg"
    s3_client.upload_fileobj(file, bucket_name, filename)
    return f"https://{bucket_name}.s3.eu-central-1.amazonaws.com/{filename}"