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
  name        = "day48-ignore-changes-sg"
  description = "Day 48 Terraform ignore_changes demo"
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
    ignore_changes = [
      tags
    ]
  }

  tags = {
    Name    = "day48-ignore-changes-sg"
    Project = "Manually Changed"
    Day     = "48"
  }
}


