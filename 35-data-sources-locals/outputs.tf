output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "security_group_id" {
  value = aws_security_group.web.id
}

output "security_group_name" {
  value = aws_security_group.web.name
}

output "common_tags" {
  value = local.common_tags
}

output "name_prefix" {
  value = local.name_prefix
}

