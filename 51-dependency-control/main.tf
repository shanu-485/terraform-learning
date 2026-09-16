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

resource "terraform_data" "first" {
  input = "First resource"
}

resource "terraform_data" "second" {
  input = "Second resource"

  depends_on = [
    terraform_data.first
  ]
}

output "first_value" {
  value = terraform_data.first.output
}

output "second_value" {
  value = terraform_data.second.output
}

