terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "random" {}

resource "random_pet" "state_demo" {
  length = 2
}

output "pet_name" {
  value = random_pet.state_demo.id
}

