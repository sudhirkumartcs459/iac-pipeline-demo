#!/bin/bash
set -e

###  Installing Nginx
sudo apt update
sudo apt install nginx

###  Adjusting the Firewall
sudo ufw allow 'Nginx HTTP'