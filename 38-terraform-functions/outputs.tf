output "vpc_id" {
  description = "Selected VPC ID"
  value       = data.aws_vpc.selected.id
}

output "security_group_id" {
  description = "Created security group ID"
  value       = aws_security_group.web.id
}

output "security_group_name" {
  description = "Created security group name"
  value       = aws_security_group.web.name
}

output "project_name_after_functions" {
  description = "Project name after trimspace and lower"
  value       = local.project_name
}

output "environment_after_functions" {
  description = "Environment after trimspace and lower"
  value       = local.environment
}

output "name_prefix" {
  description = "Name created using join"
  value       = local.name_prefix
}
