output "app_url" {
  value = "http://${aws_alb.web_app.dns_name}"
  description = "Access your app here"
}

output "s3_bucket" {
  value = aws_s3_bucket.avatars.bucket
  description = "S3 bucket for avatars"
}