output "security_group_id" {
  description = "ID of the Day 28 security group"
  value       = aws_security_group.web.id
}

output "security_group_name" {
  description = "Name of the Day 28 security group"
  value       = aws_security_group.web.name
}

output "common_tags" {
  description = "Common tags used by the configuration"
  value       = local.common_tags
}
