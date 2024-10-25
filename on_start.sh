#!/bin/bash

echo "eula=$EULA" >> /rainbowolves/server/eula.txt

service nginx start

certbot --nginx

service nginx reload

cd /rainbowolves/server

java -Xmx3072M -Xms1024M -jar paper.jar

