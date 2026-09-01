output "security_group_id" {
  description = "Created security group ID"
  value       = module.web_security_group.security_group_id
}

output "security_group_name" {
  description = "Created security group name"
  value       = module.web_security_group.security_group_name
}

