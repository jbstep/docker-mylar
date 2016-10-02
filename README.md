This repository contains material to build a docker container for the mylar application.

##Build

''docker build --tag mylar:latest .''

##Run

''docker run -d --name="mylar" --restart=always \
-v /yourlocaldirectory:/config \
-v /yourlocaldirectory:/downloads \
-v /yourlocaldirectory:/comics \
-v /etc/localtime:/etc/localtime:ro \
-e PGID=1000 -e PUID=1000  \
-p 8090:8090 jbstep/docker-mylar''

Then navigate to http://localhost:8090/
