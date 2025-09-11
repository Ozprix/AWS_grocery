#!/bin/bash
yum update -y
yum install git python3 python3-pip docker -y
systemctl start docker
systemctl enable docker

cd /home/ec2-user
git clone https://github.com/ozprix/AWS_grocery.git
cd AWS_grocery/backend

pip3 install -r requirements.txt

# Build and run Docker container
docker build -t aws-grocery-app .
docker run -d -p 5000:5000 --name grocery-app aws-grocery-app

# After docker run, add:
docker update --restart unless-stopped grocery-app