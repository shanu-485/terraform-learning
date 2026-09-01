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
  id = var.vpc_id
}

resource "aws_security_group" "web" {
  for_each = var.security_groups

  name        = "day33-${each.key}-sg"
  description = "Day 33 for_each example"
  vpc_id      = data.aws_vpc.day19.id

  ingress {
    description = each.key
    from_port   = each.value.port
    to_port     = each.value.port
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
    Name    = "day33-${each.key}-sg"
    Project = "Terraform Learning"
  }
}

