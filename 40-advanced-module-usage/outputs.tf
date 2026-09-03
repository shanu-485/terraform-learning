output "security_group_id" {
  description = "Security group ID returned by the module"
  value       = module.web_security_group.security_group_id
}

output "security_group_name" {
  description = "Security group name returned by the module"
  value       = module.web_security_group.security_group_name
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}