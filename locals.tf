locals {
  security_group_name = "${random_string.resource_prefix.result}-${var.env}-${var.envVersion}-db-sg"
  tags = {
    "environment"        = var.env
    "environmentVersion" = var.envVersion
    "createdBy"          = var.createdBy
    "owner"              = var.owner
    "role"               = var.role
    "project"            = var.project
    "product"            = var.product
  }
}