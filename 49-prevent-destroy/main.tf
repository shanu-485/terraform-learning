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

resource "aws_security_group" "web" {
  name        = "day49-prevent-destroy-sg"
  description = "Day 49 Terraform prevent_destroy demo"
  vpc_id      = "vpc-01abde828c92c4ca9"

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

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name    = "day49-prevent-destroy-sg"
    Project = "Terraform Learning"
    Day     = "49"
  }
}



