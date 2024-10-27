#!/bin/bash

chmod +x $MAINDIR/on_start.sh

apt -y update && apt install -y nginx wget

wget $JDK -O $MAINDIR/jdk.deb 
wget $PAPERMC -O $SERVERDIR/paper.jar
wget $GEYSER -O $PLUGINSDIR/geyser.jar
wget $FLOODGATE -O $PLUGINSDIR/floodgate.jar
wget $DYNMAP -O $PLUGINSDIR/dynmap.jar
wget $WORLDEDIT -O $PLUGINSDIR/worldedit.jar
wget $EBACKUP -O $PLUGINSDIR/ebackup.jar

apt install $MAINDIR/jdk.deb

#Add Certbot PPA
apt-get install software-properties-common && add-apt-repository universe add-apt-repository ppa:certbot/certbot && sudo apt-get update
#Install Certbot
apt-get -y install certbot python3-certbot-nginx

#make symlinks for nginxs
ln -s /etc/nginx/sites-available/rainbowolves.net.conf /etc/nginx/sites-enabled/rainbowolves.net.conf
ln -s /etc/nginx/sites-available/map.rainbowolves.net.conf /etc/nginx/sites-enabled/map.rainbowolves.net.conf 

#crontab certbot renewal
echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontab > /dev/null