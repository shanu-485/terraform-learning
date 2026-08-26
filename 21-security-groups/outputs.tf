output "security_group_id" {
  description = "ID of the Day 21 web security group"
  value       = aws_security_group.web.id
}

output "security_group_name" {
  description = "Name of the Day 21 web security group"
  value       = aws_security_group.web.name
}

output "vpc_id" {
  description = "VPC used by the security group"
  value       = data.aws_vpc.day19.id
}
