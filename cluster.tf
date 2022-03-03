resource "random_password" "password" {
  length           = 16
  special          = false
  override_special = "_%@"
}

resource "aws_rds_cluster" "default" {
  depends_on = [
    aws_security_group.default
  ]
  cluster_identifier      = local.identifier
  engine                  = var.engine
  engine_version          = var.engineVersion
  engine_mode             = var.engineMode
  database_name           = var.databaseName
  master_username         = var.databaseUsername
  master_password         = random_password.password.result
  vpc_security_group_ids  = [aws_security_group.default.id]
  db_subnet_group_name    = aws_db_subnet_group.default.id
  skip_final_snapshot     = var.skipFinalSnapshot
  backup_retention_period = var.backupRetentionPeriod
  storage_encrypted       = var.storageEncrypted
  copy_tags_to_snapshot   = var.copyTagsToSnapshot
  deletion_protection     = var.deletionProtection
  scaling_configuration {
    min_capacity = var.minCapacity
    max_capacity = var.maxCapacity
  }
  tags = local.tags
}