FROM python:2.7-alpine
MAINTAINER Joel Stephens https://github.com/jbstep

# Download pre-requisites
RUN apk update && apk upgrade && apk add --no-cache bash git openssh
RUN pip install cheetah tzlocal

# Download latest version
RUN mkdir -p /opt/mylar
RUN chown -R nobody:users /opt/mylar
# && chown -R nobody:users /comics \
# && chown -R nobody:users /downloads \
# && chown -R nobody:users /config \

WORKDIR /opt/mylar
RUN git clone https://github.com/evilhero/mylar.git ./app

# Create a volume for comics
RUN mkdir /comics
RUN mkdir /downloads
RUN mkdir /torrents
RUN mkdir /config

# Expose the mylar home
VOLUME /comics
VOLUME /downloads
VOLUME /torrents
VOLUME /opt/mylar
VOLUME /config

# Expose the listening port
EXPOSE 8090

USER nobody
# Launch it
CMD [ "python", "app/Mylar.py", "--datadir=/config" ]
