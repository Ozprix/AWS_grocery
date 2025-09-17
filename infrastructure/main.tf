provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Use default VPC
data "aws_vpc" "default" {
  default = true
}

# Security Groups
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP from internet"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web_app_sg" {
  name        = "web-app-sg"
  description = "Allow traffic from ALB and outbound to DB"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port       = 5000
    to_port         = 5000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow traffic from web app"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# RDS Subnet Group
resource "aws_db_subnet_group" "this" {
  name        = "${var.project_name}-db-subnet-group"
  description = "DB subnet group for ${var.project_name}"
  subnet_ids  = slice(data.aws_subnets.default.ids, 0, 2)

  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}

# MODULE: EC2
module "ec2_app" {
  source = "./modules/ec2"

  ami                    = "ami-0d527b857a28fa7fc"
  key_name               = var.key_name
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_app_sg.id]
  user_data              = file("user_data.sh")
  tags = {
    Name      = "AWS-Grocery-App"
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}

# MODULE: RDS
module "rds_db" {
  source = "./modules/rds"

  identifier             = "${var.project_name}-db"
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}

# MODULE: ALB
module "alb_app" {
  source = "./modules/alb"

  name                  = "${var.project_name}-alb"
  subnets               = slice(data.aws_subnets.default.ids, 0, 2)
  security_groups       = [aws_security_group.alb_sg.id]
  vpc_id                = data.aws_vpc.default.id
  target_group_name     = "${var.project_name}-tg"
  target_group_port     = 5000
  target_group_protocol = "HTTP"
  ec2_instance_id       = module.ec2_app.id
  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}

# MODULE: S3
module "s3_avatars" {
  source = "./modules/s3"

  bucket_name = "${var.project_name}-avatars-v1"
  tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}

# OUTPUTS
output "app_url" {
  value = "http://${module.alb_app.dns_name}"
}

output "s3_bucket" {
  value = module.s3_avatars.bucket_name
}

output "db_endpoint" {
  value = module.rds_db.endpoint
}