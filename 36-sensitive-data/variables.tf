variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "admin_password" {
  description = "Example sensitive password"
  type        = string
  sensitive   = true
}

