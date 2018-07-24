Docker Day 7 Assignment

Assignment

Install docker-compose on your machine, if not already installed. 

Create a directory named wordpress on your local. 

switch to that directory and create a file named docker-compose.yaml 

Use docker-compose version 2 to create docker-compose.yaml file. 

Create a service named "wordpress" using wordpress:latest image. 

Map port of wordpress container port 80 to host system port 8000. 

Add a parameter to restart container in case service went down. 

Within wordpress environment variable, add wordpress_db_host value along with port. 

Also add one more variable named wordpress_db_password. 

Add a volume named wordpress_data. 

*Add one more service named "db" under same docker-compose file.

Use image named mysql with version 5.7

Use volume wordpress_data and map it to /var/lib/mysql

Enable always restart parameter.

Add environment variables named "MYSQL_ROOT_PASSWORD", "MYSQL_DATABASE", "MYSQL_USER" and "MYSQL_PASSWORD" along with corresponding values for all.

At last add a dependency of db service in wordpress service.

save the file and build docker-compose.yaml and create containers for wordpress and db machine.
```
version: '3'
services:
  wordpress:
    image: wordpress:latest
    ports:
      - "8000:80"
    restart: on-failure
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_PASSWORD: redhat08
    volumes:
      - WORDPRESS_DATA:/var/lib/wordpress
    depends_on:
      - db
  db:
    image: mysql:5.7
    volumes:
      - MYSQL_DATA:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: redhat08
      MYSQL_DATABASE: db
      MYSQL_USER: root
#      MYSQL_PASSWORD: redhat08

volumes:
  WORDPRESS_DATA:
  MYSQL_DATA:


#go inside the datbase container and login into mysql using root user and password, create a new user tarun and grant access to db database with# the following command
#use db;
#grant all on db to tarun@localhost identified by 'redhat08';
#or pass the following environment which will use root privileges
#    environment:
#      MYSQL_ROOT_PASSWORD: redhat08
#      MYSQL_DATABASE: db
#      MYSQL_USER: root

```
Display currently bulit containers created using docker-compose.

```
#docker-compose up -d
```

![compose up](https://github.com/tarungoel1995/assignments/blob/master/docker/docker7/media/docker-composeup.png)


```
#docker ps
```

![containers](https://github.com/tarungoel1995/assignments/blob/master/docker/docker7/media/docker-composeup.png)
#
Stop and remove your docker container using docker-compose.

```
#docker-compose down
```
![compose down](https://github.com/tarungoel1995/assignments/blob/master/docker/docker7/media/docker-composeup.png)


Verification

![verify](https://github.com/tarungoel1995/assignments/blob/master/docker/docker7/media/wordpress.png)

Setup

![setup](https://github.com/tarungoel1995/assignments/blob/master/docker/docker7/media/wordpresssetup.png)

Installed

![installed](https://github.com/tarungoel1995/assignments/blob/master/docker/docker7/media/wordpressinstalled.png)

Dashboard

![dashboard](https://github.com/tarungoel1995/assignments/blob/master/docker/docker7/media/dashboard.png)

















