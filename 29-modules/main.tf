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
  filter {
    name   = "tag:Name"
    values = ["day19-vpc"]
  }
}

module "web_security_group" {
  source = "./modules/security-group"

  vpc_id = data.aws_vpc.day19.id
  name   = var.security_group_name
}
