terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "shanu-tf-state-20260808-007"
    key    = "terraform/state.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name

  tags = {
    Name    = "Terraform Remote State Demo"
    Project = "Terraform Learning"
  }
}