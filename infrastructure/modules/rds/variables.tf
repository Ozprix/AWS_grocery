variable "identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "storage_type" {
  description = "Storage type"
  type        = string
  default     = "gp3"
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "VPC security group IDs"
  type        = list(string)
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "publicly_accessible" {
  description = "Is DB publicly accessible?"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Enable Multi-AZ?"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 0
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on delete?"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Enable deletion protection?"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Apply changes immediately?"
  type        = bool
  default     = true
}

variable "auto_minor_version_upgrade" {
  description = "Auto upgrade minor version?"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for RDS instance"
  type        = map(string)
  default     = {}
}