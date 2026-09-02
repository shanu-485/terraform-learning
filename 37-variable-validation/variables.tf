variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"

  validation {
    condition     = contains(["ap-south-1", "us-east-1"], var.aws_region)
    error_message = "aws_region must be either ap-south-1 or us-east-1."
  }
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string

  validation {
    condition     = can(regex("^vpc-[a-z0-9]+$", var.vpc_id))
    error_message = "vpc_id must be a valid-looking AWS VPC ID starting with vpc-."
  }
}

variable "project_name" {
  description = "Project name used in resource names"
  type        = string

  validation {
    condition     = length(var.project_name) >= 3 && length(var.project_name) <= 20
    error_message = "project_name must be between 3 and 20 characters."
  }
}

variable "http_port" {
  description = "HTTP port"
  type        = number
  default     = 80

  validation {
    condition     = var.http_port >= 1 && var.http_port <= 65535
    error_message = "http_port must be between 1 and 65535."
  }
}

