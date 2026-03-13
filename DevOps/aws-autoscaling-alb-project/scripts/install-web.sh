#!/bin/bash

sudo yum update -y
sudo yum install -y httpd

echo "Welcome to Auto Scaling Demo!" > /var/www/html/index.html

systemctl start httpd
systemctl enable httpd