output "bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.state_demo.bucket
}

output "bucket_arn" {
  description = "S3 Bucket ARN"
  value       = aws_s3_bucket.state_demo.arn
}