Assignment 2 AWS


Task 1

Create a vpc not by wizard this time but manually, having 2 public subnets and 2 private subnets and 2 protected subnets.
setup should be highly available
Create 1 IGW and 2 NGW in each availability zone and make the appropriate routes in route tables

#Created a VPC manually named as AWS2

![VPC](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/VPC.png)

![Internet Gateway](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/IG-AWS2.png)

#created 2 public subnets, 2 private subnets, and 2 private subnets

![subnets](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/Subnets.png)

Main route will remain intact, instead make 4 route tables
public_route_table 
private_route_table_1 
private_route_table_2 
protected_route_table 

#Created route tables for as mentioned above 2 NAT gateways were also attached to the routes of priavte route tables, one for each in different availibilty zones

![Route Tables](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/Routetables1.png)

Task 2

Make LAMP setup with 2 instances in each private subnets.
Server-1 should serve a webpage that would say "Hi! i am server 1"
Server-2 should serve a webpage that would say "Hi! i am server 2"

#created 6 instances
#2 windows instances each in one availability zone so that servers in private subnets can be tested
#2 linux instances in each private subnet

![instances](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/Instances.png)

#created lamp-server setup on all 4 instances in private subnet as defined in task.

![apache server 1 page](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/server1.png)

![apache server2 page](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/server21.png)

![php page](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/phpserver.png)


Task 3

Launch a public load balancer that would forward the requests to these 2 LAMP instances
create the same setup using aws-cli except vpc
Created a load balancer which includes Public Subnets in both availibilty zone and targets all 4 Lamp server in both private subnets.

![Load balancer](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/loadbalancer.png)

Verification from all 4 lamp-servers:

![server 1](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/server1loadbalancer.png)

![server 2](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/server2loadbalancer.png)

![server 1](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/server1-1loadbalancer.png)

![server 2](https://github.com/tarungoel1995/assignments/blob/master/AWS/day2/media/server2-1loadbalancer.png)
