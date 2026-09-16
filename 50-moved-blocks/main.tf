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

resource "aws_security_group" "application" {
  name        = "day50-moved-web-sg"
  description = "Day 50 Terraform moved block demo"
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

  tags = {
    Name    = "day50-moved-web-sg"
    Project = "Terraform Learning"
    Day     = "50"
  }
}

moved {
  from = aws_security_group.web
  to   = aws_security_group.application
}


