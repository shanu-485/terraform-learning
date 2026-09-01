variable "vpc_id" {
  description = "VPC ID for Terraform learning"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "Terraform Learning"
}

