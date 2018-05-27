FROM ubuntu
MAINTAINER TARUN GOEL
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install nodejs -y
RUN apt-get install npm -y
CMD ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g http-server
ADD index.html /usr/apps/hello-docker/index.html 
WORKDIR /usr/apps/hello-docker/
CMD http-server -s
