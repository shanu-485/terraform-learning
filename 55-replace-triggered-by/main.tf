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

resource "terraform_data" "application" {
  input = "Application v2"
}

resource "terraform_data" "server" {
  input = "Server v1"

  lifecycle {
    replace_triggered_by = [
      terraform_data.application
    ]
  }
}



