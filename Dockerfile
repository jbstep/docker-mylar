FROM python:2-alpine
MAINTAINER Joel Stephens https://github.com/jbstep

# Download pre-requisites
RUN apk update && apk upgrade && apk add --no-cache bash git openssh
RUN pip install cheetah

# Download latest version
RUN mkdir -p /opt/mylar
WORKDIR /opt/mylar
RUN git clone https://github.com/evilhero/mylar.git ./app

# Create a volume for comics
RUN mkdir /comics
Run chown 1000:1000 /comics
RUN mkdir /downloads
Run chown 1000:1000 /downloads
RUN mkdir /torrents
Run chown 1000:1000 /torrents
RUN mkdir /config
Run chown 1000:1000 /config

# Expose the mylar home
VOLUME /comics
VOLUME /downloads
VOLUME /torrents
VOLUME /opt/mylar
VOLUME /config

# Expose the listening port
EXPOSE 8090

# Launch it
CMD [ "python", "app/Mylar.py", "--datadir=/config" ]
