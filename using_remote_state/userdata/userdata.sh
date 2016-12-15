#!/bin/bash -ex
apt-get update -y
apt-get install -y nginx
echo "This was awesome!" > /usr/share/nginx/html/index.html
