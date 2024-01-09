#!/bin/bash
# Use this for your user data (script from top to bottom)
# Install and configure Apache (httpd) on Linux

# Update the system and install httpd
yum update -y
yum install -y httpd

# Start and enable httpd service
systemctl start httpd
systemctl enable httpd

# Create a simple HTML file with a greeting
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
