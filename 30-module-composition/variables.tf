variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "day30-web-server"
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = "day30-web-sg"
}

