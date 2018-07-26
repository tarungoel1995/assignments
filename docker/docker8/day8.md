Assignment 8 Docker

Assignment

Create a docker swarm cluster

Keep base machine as swarm leader 

```
# docker swarm init –advertise-addr ipaddres
(This will make the current node manager and generate a token which can be used to join manager 
```

Spin up 2 vagrants (if machine supports) and configure them as worker nodes

```
(use the above generated token to add a worker machine to the manager)
#docker swarm join --token SWMTKN-1-5ul3koxtvjo2muvg2b3nbh78e68j7xbs5lra1n66b8mmhgaomi-cdhalj9bt326ami79x7r2z9gh 192.168.0.20:2377 
```
Update docker swarm cluster

Inspect the leader and worker nodes 

```
#docker node ls
Output:
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER      STATUS      ENGINE VERSION
ry8srt55bhcxi9iqjxsou68w7 *   tarun-goel          Ready               Active              Leader              18.03.1-ce
jujpf7pltusqvrizti63dvup7         ubuntu-xenial       Ready               Active                                  18.03.1-ce
knpdd7a6tw2a1f5t7t5dw04vj     ubuntu-xenial       Ready               Active                                  18.03.1-ce 

		# docker inspect node jujpf7pltusqvrizti63dvup7
		# docker inspect node ry8srt55bhcxi9iqjxsou68w7
		# docker inspect node knpdd7a6tw2a1f5t7t5dw04vj
```

Remove a worker node from the cluster 

```
(Run this command on worker node)
# docker swarm leave –force
(Now if you check on master you will see one worker is down)
(on manager node)
# docker rm node jujpf7pltusqvrizti63dvup7
```
Add a worker node back into the cluster 

```
(on master)
# docker swarm join-token
(this will show you join tocken using which you can add back the above removed worker node back in cluster)
(on worker copy the above shown token)
# docker swarm join --token SWMTKN-1-5ul3koxtvjo2muvg2b3nbh78e68j7xbs5lra1n66b8mmhgaomi-cdhalj9bt326ami79x7r2z9gh 192.168.0.20:2377
(to verify on master)
# docker node ls 
Output:
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER      STATUS      ENGINE VERSION
ry8srt55bhcxi9iqjxsou68w7 *   tarun-goel          Ready               Active              Leader              18.03.1-ce
34azxufz7c1oi7l208kq84vl6     ubuntu-xenial       Ready               Active              Reachable           18.03.1-ce
knpdd7a6tw2a1f5t7t5dw04vj     ubuntu-xenial       Ready               Active                                  18.03.1-ce
(you can see a new worker node is added with a new node id)
```

Deploy a tomcat service onto the cluster

Run 1 container of tomcat 

```
# docker service create --name "tomcat" -p 8083:8080 tomcat
# docker service ls
output:
ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
v21yry7cwyun        tomcat              replicated          1/1                 tomcat:latest       *:8083->8080/tcp
(Even this is single container but the service is accessible in all other nodes)
```

Scale tomcat service to 3 containers 

```
# docker service scale tomcat=3
Output:
tomcat scaled to 3
overall progress: 3 out of 3 tasks 
1/3: running   [==================================================>] 
2/3: running   [==================================================>] 
3/3: running   [==================================================>] 
verify: Service converged 
```
link: ![scaling](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/media/tomcatscale.png)


Inspect running service 

```
# docker inspect service tomcat
```
Remove tomcat service. 

```
# docker service rm tomcat
```
link: ![remove](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/media/tomcatremove.png)
