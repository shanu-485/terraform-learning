terraform {
  required_version = ">= 1.5.0"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "application_name" {
  description = "Name of the application"
  type        = string
  default     = "ProductionApp"
}

resource "terraform_data" "application" {
  input = var.application_name

  lifecycle {
    precondition {
      condition = (
        var.environment != "prod" ||
        length(var.application_name) >= 8
      )

      error_message = "Production applications must have a name of at least 8 characters."
    }

    postcondition {
      condition     = self.output == var.application_name
      error_message = "Application output does not match the application name."
    }
  }
}

output "environment" {
  value = var.environment
}

output "application_name" {
  value = terraform_data.application.output
}

