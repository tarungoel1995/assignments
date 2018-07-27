Docker Day 10 Assignment

Assignment

Create a seperate docker network 'mynet' (bridge mode) and use it for below tasks.

```
#docker network create -d bridge my-bridge-network (to create a new network)
#docker network ls (to list down the networks)
#docker network inspect my-bridge-network (to inspect the created network)
```
![network](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/dockernetwork.png)

Create docker image for Spring3HibernateApp

Dockerfile

```
FROM tomcat:latest
MAINTAINER tarun tarun.goel1995@gmail.com
RUN apt-get update 
COPY Spring3HibernateApp.war /usr/local/tomcat/webapps/
EXPOSE 8080
```
```
#docker build -t spring3 .
#docker images
```
![image](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/spring3image.png)

Dockerize Spring3HibernateApp via Docker CLI

Use created image for running container 

Bind application to host machine port 80 

Persist webapps volume 

Restict memory utilization to 512M 

Container should be removed if it gets into exited state 

Run container in recently docker network 'my-net' 

```
#docker run -itdp 7000:8080 --name spring3hibernateapp -v springvol:/usr/local/tomcat/webapps --memory 512M --rm --network=my-bridge-network spring3
```
![springapp](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/Dockerizeviacli.png)

![removedafterexit](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/containerremovedafteexit.png)

Dockerize Spring3HibernateApp via Docker Compose

Deploy service using created image 

Use 'my-net' network 

Bind host machine port 80 

Instead of volume mount use data volume to persist webapps directory 

docker-compose.yml

```
version: '3'
services:
   spring3hibernateapp:
     build:
       context: /home/tarun/docker/day10/
       dockerfile: Dockerfile
     restart : on-failure
     ports:
        - 9000:8080
     volumes:
        - spring3app:/usr/local/tomcat/webapps/
     networks:
        - my-net

volumes:
  spring3app:

networks:
  my-net:
```
```
#docker-compose up -d
```

![composeup](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/dockercomposeup.png)

```
#docker ps
```

![dockerps](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/containerps.png)

Dockerize Spring3HibernateApp via Docker Swarm

Setup 1 manager and 2 worker nodes 
![clusterinitializeand manager](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/clusterinitialize.png)


Deploy Spring3HibernateApp stack using compose file 

```
#docker stack deploy –docker-compose.yml spring3
```

![stackcreation](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/stackdeployandreplicacreation.png)

Replicate service to 3 containers 

```
#docker service scale spring3_spring3hibernateapp=3
```

![scaleup](https://github.com/tarungoel1995/assignments/blob/master/docker/day10/media/scalingapp.png)
