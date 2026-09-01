output "security_group_id" {
  value = aws_security_group.web.id
}

output "security_group_name" {
  value = aws_security_group.web.name
}

output "admin_password" {
  value     = var.admin_password
  sensitive = true
}
