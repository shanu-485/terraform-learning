terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_vpc" "day19" {
  default = true
}

resource "aws_security_group" "web" {
  count = 2

  name        = "day32-web-sg-${count.index + 1}"
  description = "Day 32 count example"
  vpc_id      = data.aws_vpc.day19.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "day32-web-sg-${count.index + 1}"
    Project = "Terraform Learning"
  }
}
