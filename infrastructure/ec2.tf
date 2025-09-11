resource "aws_instance" "web_app" {
  ami                    = "ami-015cbce10f839bd0c" # Amazon Linux 2023
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_app_sg.id]
  user_data              = file("user_data.sh")

  tags = {
    Name = "AWS-Grocery-App"
  }
}