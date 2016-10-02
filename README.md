This repository contains material to build a docker container for the mylar application.

##Build

'''docker build --tag mylar:latest .'''

##Run

'''docker run --name mylar --publish 8090:8090 --detach mylar'''

Then navigate to http://localhost:8090/
