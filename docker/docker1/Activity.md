- Run a ubuntu 16.04 container
  - Name the container: "ub01"
  - Set the hostname of container: "ub.example.com"
  - Assign memory : 800 MB
  - Set environment variables
      - NAME: $(yourname)
      - ORG: Opstree
      - TEAM: Ninja
      - TASK: Docker
  - Set above defined variables from a file
  - Set container default login directory to /var/log

``` 
#docker run  -it --name ub21 --env-file="evs.env" --memory="800m" -h ub.example.com --workdir="/var/log" ubuntu:16.04 /bin/bash
```


Docker Lifecycle

- Start an Ubuntu 14.04 container
```
#docker run -it --name ubuntu ubuntu:14.04 /bin/bash
```
- Get /var/log/dpkg.log on your host machine from container

```
#docker cp ubuntu:/var/log/dpkg.log .
```
- Delete /var/log/dpkg.log that file from container
```
#docker exec -it ubuntu /bin/bash
#rm /var/log/dpkg.log
#ctrl+p+q
```
- Create a new image of the current state of container and it "ubuntu:custom"
```
#docker commit ubuntu ubuntu:custom
```
- Remove the container
```
#docker stop ubuntu
#docker rm ubuntu
```
- Run a new container of fresh image "ubuntu:custom"
```
#docker run -it --name test ubuntu:custom /bin/bash
```
- Check for the earlier deleted file inside the container
```
#cd /var/log/
#ls
(file was not there)
```

- Copy that file to container from host machine
```
#ctrl+p+q
#docker cp dpkg.log test:/var/log/
```
- Recheck the file inside container.
```
#docker exec -it ubuntu /bin/bash
#ls /var/log/
(file was there)
```

Docker Inspection

- Run a ubuntu container and inspect the following info
  - IP Address
  - Mac Address
  - Hostname
  - Container Name
  - Environment Variables
```
#docker inspect --format='Ip address = {{.NetworkSettings.IPAddress}}  MacAddress = {{.NetworkSettings.MacAddress}}  Name = {{.Name}} Env = {{.Config.Env}}  Hostname = {{.Config.Hostname}} ' test
#Output:
Ip address = 172.17.0.2  MacAddress = 02:42:ac:11:00:02  Name = /test Env = [PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin]  Hostname = 2e4786850844
```

Docker Monitoring 

- Run 2 containers 
  - Check the following resource utilization
      - Memory
      - CPU
      - Disk I/O
      - Net I/O
  - List down the process running inside the containers

```
#docker stats
  #Output:
CONTAINER ID        NAME                 CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O           PIDS
2e4786850844        inspiring_bhaskara   0.00%               2.559MiB / 6.753GiB   0.04%               11.8kB / 0B         0B / 0B             2
bd909139309c        nostalgic_meninsky   0.00%               2.5MiB / 6.753GiB     0.04%               11.9kB / 0B         6.54MB / 0B         2
```
