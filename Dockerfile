FROM debian

EXPOSE 25565/tcp
EXPOSE 19132/udp
EXPOSE 443/tcp

WORKDIR /rainbowolves

ARG EULA=FALSE
ARG MINECRAFT_VERSION=LATEST

ENV PAPERMC=https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/123/downloads/paper-1.21.1-123.jar
ENV GEYSER=https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
ENV DYNMAP=https://cdn.modrinth.com/data/fRQREgAc/versions/AdtrWcU2/Dynmap-3.7-beta-7-spigot.jar

COPY on_build.sh /rainbowolves
COPY on_start.sh /rainbowolves
# COPY all configs (minecraft plugins nginx) 

RUN chmod +x /rainbowolves/on_build.sh && /rainbowolves/on_build.sh 

ENTRYPOINT [ "/rainbowolves/on_start.sh" ]