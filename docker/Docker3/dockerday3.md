Assignment 3 Docker

Assignment 1
Docker Port:
1. Pull nginx image from dockerhub.
```
#docker pull nginx
```
2. Run a container from nginx image and map container port 80 to system port 80.
```
#docker run -itdp 80:80 nginx
```
3. Display all mapped ports on nginx image.
```
#docker container port f17fd0a4ec4e
```
4. Run a docker container named "containexpose" from nginx image and expose port 80 of container to outer world without mapping it to any of system port.
```
#docker run -itd --network host --name nginx nginx
# Access Nginx by browsing to http://localhost:80/ (to verify)
#netstat -tulpn | grep :80 (to verify)
```
Docker Volume:

1. Create docker volume named "dbvol"
```
#docker volume create dbvol
```
2. Run docker container from wordpress image and mount "dbvol" to /var/lib/mysql
```
#docker run -it --name wordpress -v dbvol:/var/lib/mysql wordpress bash
```
3. Display all docker volumes.
```
#docker volume ls
```
4. Create another docker volume named "testvol"
```
#docker volume create testvol
```
5. Remove docker volume "testvol"
```
#docker volume rm testvol
```

Docker Linking:

1. Run a container in detached mode with name "db" from image "training/postgres"
```
#docker run -itd –name db training/postgres
```
2. Run another container in detached mode with name "web" from image "training/webapp", link container "db" with alias "mydb" to this container and finally pass an inline command "python app.py" while running container.
```
#docker run -itd –name web –link db:mydb  training/webapp python app.py
```
3. Take a bash terminal in "web" container.
```
#docker exec -it web bash
```
4. Test container linking by doing a ping to "mydb"
```
#ping mydb
Output:
	PING mydb (172.17.0.2) 56(84) bytes of data.
	64 bytes from mydb (172.17.0.2): icmp_seq=1 ttl=64 time=0.364 ms
	64 bytes from mydb (172.17.0.2): icmp_seq=2 ttl=64 time=0.209 ms
	64 bytes from mydb (172.17.0.2): icmp_seq=3 ttl=64 time=0.222 ms
	64 bytes from mydb (172.17.0.2): icmp_seq=4 ttl=64 time=0.206 ms
	64 bytes from mydb (172.17.0.2): icmp_seq=5 ttl=64 time=0.200 ms
	64 bytes from mydb (172.17.0.2): icmp_seq=6 ttl=64 time=0.212 ms
	64 bytes from mydb (172.17.0.2): icmp_seq=7 ttl=64 time=0.222 ms
```
