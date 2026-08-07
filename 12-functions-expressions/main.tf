terraform {
  required_version = ">= 1.5.0"
}

locals {
  upper_name = upper(var.project_name)
  lower_name = lower(var.project_name)
  title_name = title(var.project_name)

  total_names = length(var.names)

  joined_names = join(", ", var.names)

  first_name = var.names[0]

  environment = var.environment == "prod" ? "Production" : "Development"
}