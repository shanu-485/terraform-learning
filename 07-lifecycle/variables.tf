variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Unique S3 bucket name"
  type        = string
  default     = "shanu-lifecycle-demo-20260806-001"
}