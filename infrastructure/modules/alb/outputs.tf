output "dns_name" {
  value       = aws_alb.web_app.dns_name
  description = "ALB DNS name"
}

output "arn" {
  value       = aws_alb.web_app.arn
  description = "ALB ARN"
}