#!/bin/bash

chmod +x /rainbowolves/on_start.sh

apt -y update && apt install -y nginx wget 

wget $JDK -O /rainbowolves/jdk.deb 

wget $PAPERMC -O /rainbowolves/server/paper.jar

wget $GEYSER -O /rainbowolves/server/plugins/geyser.jar

wget $FLOODGATE -O /rainbowolves/server/plugins/floodgate.jar

wget $DYNMAP -O /rainbowolves/server/plugins/dynmap.jar

wget $WORLDEDIT -O /rainbowolves/server/plugins/worldedit.jar

wget $EBACKUP -O /rainbowolves/server/plugins/ebackup.jar

apt install /rainbowolves/jdk.deb

# INSTALL  certbot