output "workspace" {
  description = "Current Terraform workspace"
  value       = terraform.workspace
}

output "security_group_id" {
  description = "Created security group ID"
  value       = aws_security_group.web.id
}

output "security_group_name" {
  description = "Created security group name"
  value       = aws_security_group.web.name
}

