output "security_group_ids" {
  description = "Security group IDs"
  value = {
    for name, sg in aws_security_group.web :
    name => sg.id
  }
}

output "security_group_names" {
  description = "Security group names"
  value = {
    for name, sg in aws_security_group.web :
    name => sg.name
  }
}
