#!/bin/bash

echo "eula=$EULA" >> /rainbowolves/server/eula.txt

/usr/sbin/nginx

if [ "$CERTBOT" = "TRUE" ]
then certbot --nginx -d rainbowolves.net -d map.rainbowolves.net
else echo "certbot is off"
fi

cd /rainbowolves/server

java -Xmx3072M -Xms1024M -jar paper.jar