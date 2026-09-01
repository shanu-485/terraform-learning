variable "vpc_id" {
  description = "VPC ID for security groups"
  type        = string
}

variable "security_groups" {
  description = "Security groups to create"
  type = map(object({
    port = number
  }))

  default = {
    frontend = {
      port = 80
    }

    backend = {
      port = 8080
    }
  }
}

