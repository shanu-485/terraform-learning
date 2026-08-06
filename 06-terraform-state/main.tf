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

resource "aws_s3_bucket" "state_demo" {
  bucket = var.bucket_name

  tags = {
    Name    = "Terraform State Demo"
    Project = "Terraform Learning"
  }
}