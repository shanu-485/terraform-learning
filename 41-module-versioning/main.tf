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

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "day41-vpc"
  cidr = "10.41.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.41.1.0/24", "10.41.2.0/24"]
  public_subnets  = ["10.41.101.0/24", "10.41.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Project   = "Terraform Learning"
    Day       = "41"
    ManagedBy = "Terraform"
  }
}
