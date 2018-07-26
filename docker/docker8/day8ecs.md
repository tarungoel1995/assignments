Docker Day 8 Assignment

Assignment

Create an ECS cluster

Setup 2 node cluster 

```
created a clsuter named nginx with 2 t2.micro instances 
```
![cluster](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/cluster.png)

Instances

![instances](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/ECSinstances.png)

Create ECR repository for nginx image 

```
created a nginx repo in ECR
```
![ECRrepo](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/nginxECRrepo.png)

```
Pulled an nginx image , tagged it and pushed the same in ECR
```
![tag&push](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/tag%26push.png)

Verification

![repoverification](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/nginxECRrepo1.png)



Deploy nginx service onto ECS cluster

Create a task definition 

```
created a task definition named nginx
```
Create a service using task definition 

```
created a service named nginx using the above created task definition.
```

Start nginx service in the cluster 

Scale nginx service to 2 containers 

![nginxservice](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/nginxsevice.png)

Inspect running service 

![verification](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/firstinstance.png)

2nd Instance

![2nd instance](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/2ndinstance.png)

Cluster with services

![clusterwith services](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/clusterwithservice.png)


Access creted service

Create a load balancer 

![load balancer](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/loadbalanceractive.png)

Register ECS instance nodes 

```
Created a target group which targets both the instances 
```
![target group](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/targetgroupwithinstances.png)

Access Nginx service 

```
Accessing nginx service via ALB
```
![accessing](https://github.com/tarungoel1995/assignments/blob/master/docker/docker8/meida2/loadbalancer.png)
