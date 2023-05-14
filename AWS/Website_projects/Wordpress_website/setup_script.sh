#!/bin/bash

# Install LAMP stack: Install Apache, MySQL, and PHP on your Linux server

sudo apt update
sudo apt install apache2 mysql-server php php-mysql

# Configure Apache so as to it will serve the Wordpress website
# creating a virtual host configuration file that specifies the document root and other settings for your sit

#  You can create a new configuration file in the /etc/apache2/sites-available/ directory
# or edit the default configuration file at /etc/apache2/sites-available/000-default.conf

<VirtualHost *:80>
    ServerName example.com
    DocumentRoot /var/www/html
    <Directory /var/www/html>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

# Install and configure MySQL:


