provider "aws" {
  region = "us-east-1"
}

# This creates the  S3 bucket for files
resource "aws_s3_bucket" "reportfiles001" {
  bucket = "reportfiles001"
  acl    = "private"
}

# IAM role for the Lambda function
resource "aws_iam_role" "lambda_execution" {
  name = "lambda_execution"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the IAM policy to the role
resource "aws_iam_role_policy_attachment" "lambda_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_execution.name
}

# This is  a Lambda function to clean up report files
resource "aws_lambda_function" "report_cleaner" {
  filename         = "report_cleaner.zip"
  function_name    = "report-cleaner"
  role             = aws_iam_role.lambda_execution.arn
  handler          = "report_cleaner.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("report_cleaner.zip")

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.reportfiles001.bucket
    }
  }
}

# A CloudWatch event rule to trigger the Lambda function
resource "aws_cloudwatch_event_rule" "schedule" {
  name                = "report_cleaner_schedule"
  description         = "Schedule for the report cleaner Lambda function"
  schedule_expression = "cron(0 0 ? * SUN *)"
}

# A  CloudWatch event target to invoke the Lambda function
resource "aws_cloudwatch_event_target" "report_cleaner" {
  rule      = aws_cloudwatch_event_rule.schedule.name
  arn       = aws_lambda_function.report_cleaner.arn
  target_id = "report_cleaner_target"
}

# An SNS topic to send alerts if lingering files are found
resource "aws_sns_topic" "report_alerts" {
  name = "report-alerts"
}

# The SNS subscription to send alerts to the devops team
resource "aws_sns_topic_subscription" "report_alerts_subscription" {
  topic_arn = aws_sns_topic.report_alerts.arn
  protocol  = "email"
  endpoint  = "devops@successacademy.com"    #Please change to it to right email before executing the job
}
