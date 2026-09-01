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

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_security_group" "web" {
  name        = "day36-sensitive-sg"
  description = "Day 36 sensitive data example"
  vpc_id      = data.aws_vpc.selected.id

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
    Name      = "day36-sensitive-sg"
    Project   = "Terraform Learning"
    ManagedBy = "Terraform"
  }
}

resource "terraform_data" "secret_demo" {
  input = var.admin_password
}

