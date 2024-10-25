FROM debian

EXPOSE 25565/tcp
EXPOSE 19132/udp
EXPOSE 443/tcp
EXPOSE 80/tcp

ENV EULA=""

ARG MAINDIR=/rainbowolves
ARG SERVERDIR=${MAINDIR}/server
ARG PLUGINSDIR=${SERVERDIR}/plugins

ARG JDK=https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
ARG PAPERMC=https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/123/downloads/paper-1.21.1-123.jar
ARG GEYSER=https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
ARG FLOODGATE=https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot
ARG DYNMAP=https://cdn.modrinth.com/data/fRQREgAc/versions/AdtrWcU2/Dynmap-3.7-beta-7-spigot.jar
ARG WORLDEDIT=https://cdn.modrinth.com/data/1u6JkXh5/versions/ecqqLKUO/worldedit-bukkit-7.3.8.jar
ARG EBACKUP=https://hangarcdn.papermc.io/plugins/espidev/eBackup/versions/1.3.1/PAPER/ebackup-1.3.1.jar

WORKDIR ${MAINDIR}

COPY on_build.sh ${MAINDIR}
COPY on_start.sh ${MAINDIR}
COPY server ${SERVERDIR}
COPY etc /etc
COPY var /var

RUN chmod +x on_build.sh && on_build.sh

ENTRYPOINT [ "on_start.sh" ]