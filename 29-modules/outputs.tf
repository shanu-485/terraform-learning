output "security_group_id" {
  description = "Security group ID created by the module"
  value       = module.web_security_group.security_group_id
}

output "security_group_name" {
  description = "Security group name created by the module"
  value       = module.web_security_group.security_group_name
}
