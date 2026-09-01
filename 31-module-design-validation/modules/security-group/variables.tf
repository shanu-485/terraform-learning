variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string

  validation {
    condition     = length(var.vpc_id) > 0
    error_message = "vpc_id must not be empty."
  }
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string

  validation {
    condition     = length(var.security_group_name) >= 3
    error_message = "Security group name must be at least 3 characters long."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}
