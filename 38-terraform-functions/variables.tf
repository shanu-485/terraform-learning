variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = " Terraform-Functions "
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = " DEV "
}

variable "http_port" {
  description = "HTTP port"
  type        = number
  default     = 80
}

