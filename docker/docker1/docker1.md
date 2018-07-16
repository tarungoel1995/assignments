Assignment 1 Docker



1. Use official shell script to install and configure Docker on your control machine.

```
#curl -fsSL get.docker.com -o get-docker.sh
#sudo sh get-docker.sh
```

2. Start Docker service and check status of the same.
```
#sudo service docker start
#sudo service docker status
```

3. Enable Docker service to start at every machine reboot.
```
#sudo systemctl enable docker 
```
4. Display Docker version.
```
#docker –version
```

5. Configure non root user to run docker commands without sudo.
```
# sudo usermod -aG docker $(whoami)
```
6. Display System information using Docker.
```
#sudo docker system info
```

7. Check whether you can access/download images from DockerHub or not.
```
# sudo docker run hello-world
```




