output "bucket_name" {
  description = "Lifecycle Demo Bucket Name"
  value       = aws_s3_bucket.lifecycle_demo.bucket
}

output "bucket_arn" {
  description = "Lifecycle Demo Bucket ARN"
  value       = aws_s3_bucket.lifecycle_demo.arn
}