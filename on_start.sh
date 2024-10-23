#!/bin/bash

echo "eula=$EULA" >> /rainbowolves/server/eula.txt

#systemctl start nginx

cd /rainbowolves/server && java -Xmx3072M -Xms1024M -jar paper.jar

# 1) run nginx if not runned, check TLSserts and renew via certbot if expired