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

resource "aws_s3_bucket" "workspace_demo" {
  bucket = "${var.bucket_prefix}-${terraform.workspace}"

  tags = {
    Environment = terraform.workspace
    Project     = "Terraform Workspace Demo"
  }
}