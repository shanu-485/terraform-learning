variable "region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "terraform learning"
}

variable "environment" {
  default = "dev"
}

variable "names" {
  type = list(string)

  default = [
    "aws",
    "terraform",
    "docker"
  ]
}