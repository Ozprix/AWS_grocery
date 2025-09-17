resource "aws_db_instance" "db" {
  identifier                = var.identifier
  engine                    = var.engine
  port                      = var.port
  instance_class            = var.instance_class
  allocated_storage         = var.allocated_storage
  storage_type              = var.storage_type
  db_subnet_group_name      = var.db_subnet_group_name
  vpc_security_group_ids    = var.vpc_security_group_ids
  db_name                   = var.db_name
  username                  = var.username
  password                  = var.password
  publicly_accessible       = var.publicly_accessible
  multi_az                  = var.multi_az
  backup_retention_period   = var.backup_retention_period
  skip_final_snapshot       = var.skip_final_snapshot
  deletion_protection       = var.deletion_protection
  apply_immediately         = var.apply_immediately
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  tags = var.tags
}