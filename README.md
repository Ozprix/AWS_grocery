# 🍏 AWS GroceryMate – Cloud-Native Grocery App

> A cloud-native grocery management application that demonstrates end-to-end AWS deployment using Infrastructure as Code (Terraform).

This project serves as a portfolio showcase of skills in:

- 🌐 Full-stack development (React + Flask)  
- ☁️ Cloud infrastructure (AWS EC2, RDS, S3, ALB, Security Groups)  
- ⚙️ Infrastructure as Code (Terraform)  
- 🐳 Containerization (Docker for backend)

---

## 🌐 Live App

🔗 Access the app here:  
👉 [http://aws-grocery-alb-1251741495.eu-central-1.elb.amazonaws.com](http://aws-grocery-alb-1251741495.eu-central-1.elb.amazonaws.com)

![Live GroceryMate App](images/app-live.png)

---

## 📖 Features

### 🍽️ Application

- 👨‍🍳 **Frontend**: React + TailwindCSS  
- 🛠 **Backend**: Flask REST API with Docker  
- 🗄 **Database**: PostgreSQL on Amazon RDS  
- 🖼 **File Storage**: AWS S3 for static assets/avatars

### 🏗️ Infrastructure

- 🖥 **Amazon EC2**: Hosts the backend Flask app  
  ![EC2 Instance Running](images/aws-console-ec2.png)

- 🔒 **Security Groups**: Least-privilege networking rules  

- 🌍 **Application Load Balancer**: Routes traffic to backend  
  ![ALB Health Check](images/aws-console-alb.png)

- 💾 **Amazon RDS**: Managed PostgreSQL database  
  ![RDS Instance](images/aws-console-rds.png)

- 📦 **Amazon S3**: Stores static files (avatars, images)  
  ![S3 Bucket](images/aws-console-s3.png)

- 📜 **Terraform**: Manages provisioning and deployment

---

## 📂 Repository Structure
AWS_GroceryMate/
├── backend/ # Flask API (Dockerized)
├── frontend/ # React + Tailwind frontend
├── infrastructure/ # Terraform IaC configs
├── images/ # Screenshots + architecture diagram
└── README.md # Project documentation
