output "environment_name" {
  description = "Environment selected by conditional expression"
  value       = local.environment_name
}

output "selected_port" {
  description = "Port selected by conditional expression"
  value       = local.selected_port
}

output "security_group_name" {
  description = "Created security group name"
  value       = aws_security_group.web.name
}

output "security_group_id" {
  description = "Created security group ID"
  value       = aws_security_group.web.id
}

output "vpc_id" {
  description = "Selected VPC ID"
  value       = data.aws_vpc.selected.id
}

