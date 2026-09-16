terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "application" {
  input = "Wrong Aplication"
}

check "application_check" {
  assert {
    condition     = terraform_data.application.output == "Application"
    error_message = "Application output is not correct."
  }
}


