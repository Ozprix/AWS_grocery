output "endpoint" {
  value = aws_db_instance.db.endpoint
  description = "RDS endpoint"
}

output "id" {
  value = aws_db_instance.db.id
  description = "RDS instance ID"
}