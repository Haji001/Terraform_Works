# Bucket name
variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to create for report files."
}

# Lambda function name
variable "lambda_function_name" {
  type        = string
  description = "The name of the Lambda function to create for cleaning up report files."
}

# Lambda handler
variable "lambda_handler" {
  type        = string
  description = "The name of the Lambda handler function to execute."
}

#Schedule expression
variable "schedule_expression" {
  type        = string
  description = "The schedule expression for the CloudWatch event rule to trigger the Lambda function."
}

# The sns-alert notification name
variable "sns_topic_name" {
  type        = string
  description = "The name of the SNS topic to create for sending alerts."
}

# The endpoint email - Which is my personal email in this point but I'm assuming that Success Academy devops team will change the email when they began testing.
variable "sns_subscription_endpoint" {
  type        = string
  description = "The email address where SNS alerts should be sent."
}

