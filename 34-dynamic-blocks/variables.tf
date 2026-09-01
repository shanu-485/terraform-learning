variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = "day34-dynamic-sg"
}

variable "ingress_rules" {
  description = "Ingress rules for the security group"

  type = list(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      description = "HTTP"
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTPS"
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

