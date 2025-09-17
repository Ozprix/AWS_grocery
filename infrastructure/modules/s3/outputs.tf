output "bucket_name" {
  value = aws_s3_bucket.avatars.bucket
  description = "S3 bucket name"
}

output "arn" {
  value = aws_s3_bucket.avatars.arn
  description = "S3 bucket ARN"
}