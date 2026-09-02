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
  project_name = lower(trimspace(var.project_name))
  environment  = lower(trimspace(var.environment))

  name_prefix = join("-", [
    local.project_name,
    local.environment
  ])

  tags = {
    Name        = format("%s-web-sg", local.name_prefix)
    Project     = "Terraform Learning"
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_security_group" "web" {
  name        = format("%s-web-sg", local.name_prefix)
  description = "Day 38 Terraform functions demo"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

