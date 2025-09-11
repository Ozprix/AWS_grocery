# 🛒 AWS GroceryMate — Infrastructure as Code with Terraform

> A Flask-based grocery app deployed on AWS using Terraform, Docker, ALB, RDS, and S3.

---

## 🚀 Features

- ✅ Flask app containerized with Docker
- ✅ Deployed on EC2 behind an Application Load Balancer (ALB)
- ✅ Connected to RDS PostgreSQL database
- ✅ User avatars stored in S3 bucket
- ✅ Fully automated with Terraform
- ✅ Secured with Security Groups and least-privilege access

---

## 🌐 Live App

🔗 Access the app here:  
👉 [http://aws-grocery-alb-1251741495.eu-central-1.elb.amazonaws.com](http://aws-grocery-alb-1251741495.eu-central-1.elb.amazonaws.com)

![Live GroceryMate App](images/app-live.png)

---

## 🔐 Security Notes

- SSH access locked to your IP
- RDS not publicly accessible
- S3 bucket policy pending (use pre-signed URLs for production)
- All resources tagged for cost tracking

![EC2 Instance Running](images/aws-console-ec2.png)
![ALB Health Check](images/aws-console-alb.png)
![RDS Instance](images/aws-console-rds.png)
![S3 Bucket](images/aws-console-s3.png)

---

## 🏗️ Architecture Diagram

This is how your infrastructure is connected:

![AWS Architecture](images/architecture-diagram.png)
