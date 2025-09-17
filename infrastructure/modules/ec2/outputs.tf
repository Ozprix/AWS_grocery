output "public_ip" {
  value = aws_instance.web_app.public_ip
}

output "id" {
  value = aws_instance.web_app.id
}