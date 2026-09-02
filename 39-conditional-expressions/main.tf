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
  # Conditional expression:
  # prod  -> HTTPS (443)
  # other -> HTTP (80)
  selected_port = var.environment == "prod" ? var.https_port : var.http_port

  environment_name = var.environment == "prod" ? "production" : "development"

  security_group_name = "day39-${local.environment_name}-web-sg"
}

resource "aws_security_group" "web" {
  name        = local.security_group_name
  description = "Day 39 Terraform conditional expressions demo"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "Selected application port"

    from_port = local.selected_port
    to_port   = local.selected_port

    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = local.security_group_name
    Project     = "Terraform Learning"
    Environment = local.environment_name
    ManagedBy   = "Terraform"
  }
}

