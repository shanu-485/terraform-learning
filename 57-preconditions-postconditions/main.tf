terraform {
  required_version = ">= 1.5.0"
}

variable "application_name" {
  description = "Name of the application"
  type        = string
  default     = "Application"
}

resource "terraform_data" "application" {
  input = var.application_name

  lifecycle {
    precondition {
      condition     = length(var.application_name) >= 5
      error_message = "Application name must contain at least 5 characters."
    }

    postcondition {
      condition     = self.output == "Application"
      error_message = "Application output is not correct."
    }
  }
}





