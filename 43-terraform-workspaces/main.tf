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
  region = var.aws_region
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

locals {
  environment = terraform.workspace

  security_group_name = "day43-${local.environment}-web-sg"
}

resource "aws_security_group" "web" {
  name        = local.security_group_name
  description = "Day 43 Terraform workspace demo"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = local.security_group_name
    Project     = "Terraform Learning"
    Day         = "43"
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}
