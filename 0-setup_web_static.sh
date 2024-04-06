#!/usr/bin/env bash
# Script to set up web servers for the deployment of web_static

# Update apt-get package index
sudo apt-get update

# Install nginx web server
sudo apt-get -y install nginx

# Allow HTTP traffic through UFW firewall for Nginx
sudo ufw allow 'Nginx HTTP'

# Create necessary directory structure for web_static deployment
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/

# Create a sample index.html file for testing
sudo touch /data/web_static/releases/test/index.html
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

# Create a symbolic link to make 'current' point to 'test'
sudo ln -s -f /data/web_static/releases/test/ /data/web_static/current

# Change ownership of the /data directory to user 'ubuntu'
sudo chown -R ubuntu:ubuntu /data/

# Configure Nginx to serve static files from /data/web_static/current directory
sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default

# Restart Nginx to apply the changes
sudo service nginx restart
