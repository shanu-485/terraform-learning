variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for EC2"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}

