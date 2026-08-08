terraform {
  required_version = ">= 1.5.0"
}

resource "null_resource" "local_demo" {

  provisioner "local-exec" {
    command = "echo Terraform Provisioner Executed! > output.txt"
  }
}