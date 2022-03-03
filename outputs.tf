output "subnet_group" {
  value = aws_db_subnet_group.default.name
}

output "db_instance_id" {
  value = aws_rds_cluster.default.id
}
output "db_endpoint" {
  value = aws_rds_cluster.default.endpoint
}

output "db_port" {
  value = aws_rds_cluster.default.port
}

output "db_user" {
  value = aws_rds_cluster.default.master_username
}

output "db_password" {
  sensitive = true
  value     = random_password.password.result
}
