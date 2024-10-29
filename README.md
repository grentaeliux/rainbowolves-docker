# rainbowolves-docker
Small crossplatform Minecraft server with it`s site. All in docker container.


```docker run -e EULA="TRUE" -e CERTBOT="TRUE" -p 25565:25565 -p 19132:19132/udp -p 80:80 -p 443:443 xivewininnger/rainbowolves-docker``` 

Without  CERTBOT="TRUE" certiffication issue will be skiped.
