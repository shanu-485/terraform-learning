terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "random" {
}

resource "random_pet" "name" {
  length = 2
}


