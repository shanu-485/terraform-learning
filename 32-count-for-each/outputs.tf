output "security_group_ids" {
  description = "IDs of all security groups created with count"
  value       = aws_security_group.web[*].id
}

output "security_group_names" {
  description = "Names of all security groups created with count"
  value       = aws_security_group.web[*].name
}
