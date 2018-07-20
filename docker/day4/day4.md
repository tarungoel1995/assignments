Docker Day4 Assignment

Assignment 1

1. Create a file named index.js with below content. 

index.js

var os = require("os"); var hostname = os.hostname(); console.log("hello from " + hostname);

```
Filelink: https://github.com/tarungoel1995/assignments/blob/master/docker/docker_4_1/index.js
```

2. Create a file named Dockerfile and write code as per the steps mentioned. 

Use alpine image. 

Add Author/Maintainer name in DockerFile 

run commands -> apk update & apk add nodejs 

copy current directory to /app 

change your working directory to /app 

specify the default command to be run upon container creation as mentioned below. node index.js 

Link of Docker file: https://github.com/tarungoel1995/assignments/blob/master/docker/docker_4_1/Dockerfile
```
FROM alpine
MAINTAINER Tarun goel
RUN apk update
RUN apk add nodejs
RUN mkdir -p /app
RUN mkdir -p /tarun
COPY index.js /app
WORKDIR /app
CMD node index.js

```

3. Build image from Dockerfile. 

```
#docker build -t nodejs .
```

![build](https://github.com/tarungoel1995/assignments/blob/master/docker/day4media/imagebuildday4.png)

4. Tag image with name "hello:v0.1" 

```
#docker image tag nodejs hello:v1.0
```

![tag](https://github.com/tarungoel1995/assignments/blob/master/docker/day4media/tagimage.png)

Container from the same image.

![container](https://github.com/tarungoel1995/assignments/blob/master/docker/day4media/container1.png)

Assignment 2

1. Create a DockerFile.
2. Use Ubuntu latest image.
3. Add your name as a Manintainer.
4. Update local packages using command (apt-get update).
5. Install nodejs package.
6. Install npm package.
7. Create a symlink using command (ln -s /usr/bin/nodejs /usr/bin/node).
8. Trigger a command (npm install -g http-server)
9. Add any test index.html file from local at /usr/apps/hello-docker/index.html on container.
10. change your working directory to /usr/apps/hello-docker/.
11. Run a command (http-server -s) on every container initialization.
12. Build your dockerfile and tag it with "yourname:docker-web"

Dockerfile Link: https://github.com/tarungoel1995/assignments/blob/master/docker/docker_4_2/Dockerfile

```
FROM ubuntu
MAINTAINER TARUN GOEL
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install nodejs -y
RUN apt-get install npm -y
CMD ln -s /usr/bin/nodejs /usr/bin/node/
RUN npm install -g http-server
ADD index.html /usr/apps/hello-docker/index.html 
WORKDIR /usr/apps/hello-docker/
CMD http-server -s
```

```
#docker build -t tarun:docker-web .
```

![build](https://github.com/tarungoel1995/assignments/blob/master/docker/day4media/build2.png)

13. Run a docker container from the image that you have just created and map container 8080 port to host 8080 port.(8080:8080)

```
#docker run -itp 8080:8080 --name hellodocker
```

14. Try accessing your webpage using "http://<virtualmachine_ipaddress>:8080/index.html" URL.

![browser](https://github.com/tarungoel1995/assignments/blob/master/docker/day4media/browserouput2.png)

15. Delete docker container and image from local.

```
#docker stop hellodocker
#docker rm hellodocker
#docker rmi tarun:docker-web
```
