output "bucket_name" {
  value = aws_s3_bucket.reportfiles001.id
}

output "lambda_function_name" {
  value = aws_lambda_function.report_cleaner.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.report_cleaner.arn
}

output "schedule_expression" {
  value = aws_cloudwatch_event_rule.schedule.schedule_expression
}

output "sns_topic_arn" {
  value = aws_sns_topic.report_alerts.arn
}

output "sns_topic_subscription_endpoint" {
  value = aws_sns_topic_subscription.report_alerts_subscription.endpoint
}

