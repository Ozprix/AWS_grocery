variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Name prefix for resources"
  type        = string
  default     = "app"
}

variable "ssh_public_key_path" {
  description = "Path to your local SSH public key (e.g., ~/.ssh/id_rsa.pub)"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_allowed_cidr" {
  description = "CIDR allowed to SSH (e.g., 203.0.113.10/32)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "http_allowed_cidr" {
  description = "CIDR allowed to access HTTP/HTTPS"
  type        = string
  default     = "0.0.0.0/0"
}

variable "db_name" {
  description = "Initial DB name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master DB username"
  type        = string
  default     = "app_user"
}

variable "db_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
  default     = "Groc3ry!Mat3#2025"
}

variable "db_engine" {
  description = "RDS engine"
  type        = string
  default     = "postgres"
}

variable "db_port" {
  description = "RDS port"
  type        = number
  default     = 5432
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS storage in GB"
  type        = number
  default     = 20
}

variable "key_name" {
  description = "Name of the SSH key pair in AWS (e.g., Myamazon.pem)"
  type        = string
  default     = "Myamazon"
}

variable "aws_grocery" {
  description = "Name of the AWS grocery project"
  type        = string
  default     = "aws-grocery-app"
}