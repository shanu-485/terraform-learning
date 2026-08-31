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

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["day19-public-subnet"]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "security_group" {
  source = "./modules/security-group"

  vpc_id              = data.aws_vpc.day19.id
  security_group_name = var.security_group_name
}

module "ec2" {
  source = "./modules/ec2"

  ami_id            = data.aws_ami.amazon_linux.id
  subnet_id         = data.aws_subnet.public.id
  security_group_id = module.security_group.security_group_id
  instance_name     = var.instance_name
}
