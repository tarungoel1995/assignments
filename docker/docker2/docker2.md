	Assignment 2 Docker

	Assignment 1
1. Run a docker container from "hello-world" image.

#docker run hello-world

2. Pull "alpine" image from docker registry and see if image is available in your local image list.
```
#docker pull alpine
#docker image
Output:-
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              e38bc07ac18e        6 weeks ago         1.85kB
alpine              latest              3fd9065eaf02        4 months ago        4.15MB
```
3. Pull some specific version of docker "alpine" image from docker registry.

#docker pull alpine:3.3

4. Run a docker container from local image "alpine" and run an inline command "ls -l" while running container.
```
# docker run -it alpine ls -l
Output:-
total 52
drwxr-xr-x    2 root     root          4096 Jan  9 19:37 bin
drwxr-xr-x    5 root     root           360 May 30 06:44 dev
drwxr-xr-x    1 root     root          4096 May 30 06:44 etc
drwxr-xr-x    2 root     root          4096 Jan  9 19:37 home
drwxr-xr-x    5 root     root          4096 Jan  9 19:37 lib
drwxr-xr-x    5 root     root          4096 Jan  9 19:37 media
drwxr-xr-x    2 root     root          4096 Jan  9 19:37 mnt
dr-xr-xr-x  123 root     root             0 May 30 06:44 proc
drwx------    2 root     root          4096 Jan  9 19:37 root
drwxr-xr-x    2 root     root          4096 Jan  9 19:37 run
drwxr-xr-x    2 root     root          4096 Jan  9 19:37 sbin
drwxr-xr-x    2 root     root          4096 Jan  9 19:37 srv
dr-xr-xr-x   13 root     root             0 May 30 06:44 sys
drwxrwxrwt    2 root     root          4096 Jan  9 19:37 tmp
drwxr-xr-x    7 root     root          4096 Jan  9 19:37 usr
drwxr-xr-x   11 root     root          4096 Jan  9 19:37 var
```

5. Try to take login to container created using "alpine" image.

#docker run -it alpine /bin/ash

6. Detach yourself from the container without making it exit/container kill.

#ctrl + p +q

7. Check running containers and see if you can find out the stopped containers.
```
#docker ps
Output:-
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
b78ad027cede        alpine              "/bin/sh"           5 seconds ago       Up 4 seconds                            quirky_dubinsky
```
8. Stop running container.
```
#docker stop b78ad027cede
#docker ps (you will see no container is running)
```

9. Start container that was stopped earlier.

```
#docker start b78ad027cede
#docker ps (you will see container is running with same container id)
```
10. Try to remove "alpine" image from your local system.
```
#docker rmi alpine
Oupout:-
Error response from daemon: conflict: unable to remove repository 	reference "alpine" (must force) - container b78ad027cede is using its 	referenced image 3fd9065eaf02
```
Assignment 2

1. Again pull "alpine" image from docker registry.
2. Take interactive login to bash while running docker container from "alpine" image.
3. Run command inside container: echo "hello world" > hello.txt ls
4. Take exit from same container without killing the container.
5. Run another container using below command and check if you can find hello.txt within this container. You should find container isolations from step 3-5. docker container run alpine ls
6. Stop a container using Container ID.
7. Start same container using ID and exec a command "echo 'hello world!'" in docker container without instantiating a new container.
8. Inspect already downloaded "alpine" docker image using docker inspect command.
9. Tag your local "alpine" image with name "myimage" along with version 1.0

