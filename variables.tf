variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "envVersion" {
  default = "v1"
}

variable "product" {
  default = "rocketseat"
}

variable "project" {
  default = "travels-backend"
}

variable "role" {
  default = "db"
}

variable "owner" {
  default = "squad-rocketseat"
}

variable "createdBy" {
  default = "devops-tools"
}

variable "engine" {
  default = "aurora-postgresql"
}

variable "engineVersion" {
  default = "10.7"
}
variable "engineMode" {
  default = "serverless"
}

variable "databaseName" {
  default = "travels"
}

variable "databaseUsername" {
  default = "travels"
}

variable "backupRetentionPeriod" {
  default = "5"
}

variable "storageEncrypted" {
  default = "true"
}

variable "deletionProtection" {
  default = "true"
}
# SHOULD BE false IN A PRODUCTION ENVIRONMENT
variable "skipFinalSnapshot" {
  default = "true"
}
variable "copyTagsToSnapshot" {
  default = "true"
}
variable "autoPause" {
  default = "true"
}
variable "secondsUntilAutoPause" {
  default = "300"
}
variable "minCapacity" {
  default = "2"
}
variable "maxCapacity" {
  default = "8"
}
variable "timeoutAction" {
  default = "ForceApplyCapacityChanges"
}