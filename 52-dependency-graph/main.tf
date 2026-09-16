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

resource "terraform_data" "database" {
  input = "Database"
}

resource "terraform_data" "application" {
  input = "Application"

  depends_on = [
    terraform_data.database
  ]
}

resource "terraform_data" "frontend" {
  input = "Frontend"

  depends_on = [
    terraform_data.application
  ]
}


