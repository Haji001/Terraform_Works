variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to create for report files."
}

variable "lambda_function_name" {
  type        = string
  description = "The name of the Lambda function to create for cleaning up report files."
}

variable "lambda_handler" {
  type        = string
  description = "The name of the Lambda handler function to execute."
}

variable "schedule_expression" {
  type        = string
  description = "The schedule expression for the CloudWatch event rule to trigger the Lambda function."
}

variable "sns_topic_name" {
  type        = string
  description = "The name of the SNS topic to create for sending alerts."
}

variable "sns_subscription_endpoint" {
  type        = string
  description = "The email address where SNS alerts should be sent."
}

