locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  security_group_name = "day35-${var.environment}-sg"

  name_prefix = lower("${var.project_name}-${var.environment}")
}

