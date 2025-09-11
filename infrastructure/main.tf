provider "aws" {
  region  = var.aws_region  # Should be "eu-central-1" if that's where you're deploying
  profile = var.aws_profile
}
locals {
  name_prefix = "${var.aws_grocery}-${terraform.workspace}"
  tags = {
    Project     = var.aws_grocery
    ManagedBy   = "Terraform"
    Workspace   = terraform.workspace
  }
}

# Who am I / where am I
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Use the default VPC + its subnets
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# RDS needs a subnet group (>= 2 subnets, default VPC has many)
resource "aws_db_subnet_group" "this" {
  name        = "${local.name_prefix}-db-subnet-group"
  description = "DB subnet group for ${var.aws_grocery}"
  subnet_ids  = slice(data.aws_subnets.default.ids, 0, 2)

  tags = local.tags
}