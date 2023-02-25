
# This is script is to detect if the bucket is empty. I also zip the zip the file

def lambda_handler(event, context):
    
    bucket_name = os.environ['REPORT_FILES_BUCKET']

    s3 = boto3.client('s3')

    response = s3.list_objects_v2(Bucket=bucket_name)

    sns = boto3.client('sns')
    message = f"Report: S3 bucket {bucket_name} has been emptied."
    sns.publish(TopicArn=os.environ['REPORT_ALERTS_TOPIC'], Message=message)

    if 'Contents' in response:
        message = f"Warning: {len(response['Contents'])} lingering files found in S3 bucket {bucket_name}"
        sns.publish(TopicArn=os.environ['REPORT_ALERTS_TOPIC'], Message=message)
