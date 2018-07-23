Docker Day 6 Assignment

Assignment
Install docker-compose on your machine, if not already installed.
```
#sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
```

Check docker-compose version.

```
#docker-compose –version
Output:
docker-compose version 1.21.2, build a133471
```

Create a directory named nginx in your root.

```
#mkdir /nginx
```

Switch to that directory and create a file named docker-compose.yaml

```
cd /nginx
vim docker-compose.yml
```
Use docker-compose version 2 to create docker-compose.yaml file.

Create a service named "databases".

Use image named "mysql"

Map container 3306 port to host machine 3306 port.

Add environment variables named "MYSQL_ROOT_PASSWORD", "MYSQL_DATABASE", "MYSQL_USER" and "MYSQL_PASSWORD" along with corresponding values for all.

Add another service named "web"

Use image "nginx"

Save docker-compose.yaml file and do docker-compose up.
```
version: '3'
services:
  databases:
    image: mysql
    ports:
      - "3307:3306"
    env_file:
      - evs.env
  web:
    image: nginx
    ports:
      - "80:80" 
    depends_on:
      - databases
```
```
#docker-compose up -d
```

![compose -up](https://github.com/tarungoel1995/assignments/blob/master/docker/day6/media/dockercompose.png)

Verify nginx service is up and is accessible on machine.

![verification](https://github.com/tarungoel1995/assignments/blob/master/docker/day6/media/nginxhomepage.png)

Stop and remove your docker container using docker-compose.

```
#docker-compose down
```

![removing](https://github.com/tarungoel1995/assignments/blob/master/docker/day6/media/removingdocker-compose.png)

