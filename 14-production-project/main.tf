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
  region = var.region
}

module "network" {
  source = "./modules/network"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}
module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id
}
module "compute" {
  source = "./modules/compute"

  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security.security_group_id
  instance_type     = var.instance_type
  ami_id            = var.ami_id
}