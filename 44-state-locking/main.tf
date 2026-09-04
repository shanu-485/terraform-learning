terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
 backend "s3" {
  bucket       = "shanu-terraform-remote-state-2026"
  key          = "day44/terraform.tfstate"
  region       = "ap-south-1"
  use_lockfile = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_vpc" "selected" {
  id = "vpc-01abde828c92c4ca9"
}

resource "aws_security_group" "web" {
  name        = "day44-state-locking-sg"
  description = "Day 44 state locking demo"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "day44-state-locking-sg"
    Project   = "Terraform Learning"
    Day       = "44"
    ManagedBy = "Terraform"
  }
}
