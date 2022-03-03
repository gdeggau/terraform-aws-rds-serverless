locals {
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