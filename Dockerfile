FROM debian

EXPOSE 25565/tcp
EXPOSE 19132/udp
EXPOSE 443/tcp

ENV EULA="FALSE"

ARG JDK=https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
ARG PAPERMC=https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/123/downloads/paper-1.21.1-123.jar
ARG GEYSER=https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
ARG FLOODGATE=https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot
ARG DYNMAP=https://cdn.modrinth.com/data/fRQREgAc/versions/AdtrWcU2/Dynmap-3.7-beta-7-spigot.jar
ARG WORLDEDIT=https://cdn.modrinth.com/data/1u6JkXh5/versions/ecqqLKUO/worldedit-bukkit-7.3.8.jar
ARG EBACKUP=https://hangarcdn.papermc.io/plugins/espidev/eBackup/versions/1.3.1/PAPER/ebackup-1.3.1.jar


WORKDIR /rainbowolves

COPY on_build.sh /rainbowolves
COPY on_start.sh /rainbowolves
COPY server /rainbowolves/server
COPY etc /etc
COPY var /var

RUN chmod +x /rainbowolves/on_build.sh && /rainbowolves/on_build.sh 

ENTRYPOINT [ "/rainbowolves/on_start.sh" ]