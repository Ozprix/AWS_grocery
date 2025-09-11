resource "aws_db_instance" "db" {
  identifier = "${var.project_name}-${terraform.workspace}-db"
  engine     = var.db_engine
  port       = var.db_port
  instance_class = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_type = "gp3"

  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  db_name     = var.db_name
  username    = var.db_username
  password    = var.db_password

  publicly_accessible = false
  multi_az    = false
  backup_retention_period = 0
  skip_final_snapshot = true
  deletion_protection = false
  apply_immediately = true
  auto_minor_version_upgrade = true

  tags = local.tags
}