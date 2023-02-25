def lambda_handler(event, context):
    # Get the name of the S3 bucket from the environment variables
    bucket_name = os.environ['REPORT_FILES_BUCKET']

    # Create an S3 client
    s3 = boto3.client('s3')

    # List all objects in the bucket
    response = s3.list_objects_v2(Bucket=bucket_name)

    # Send an alert via SNS, regardless of whether objects are found
    sns = boto3.client('sns')
    message = f"Report: S3 bucket {bucket_name} has been emptied."
    sns.publish(TopicArn=os.environ['REPORT_ALERTS_TOPIC'], Message=message)

    # Check if any objects are found
    if 'Contents' in response:
        # If there are objects, send another alert via SNS
        message = f"Warning: {len(response['Contents'])} lingering files found in S3 bucket {bucket_name}"
        sns.publish(TopicArn=os.environ['REPORT_ALERTS_TOPIC'], Message=message)
