Assignment 1 AWS

Task 1
Create a vpc through wizard, having one public subnet and one private subnet.
#Created a vpc named Tarun in Mumbai region , One public subnet named 
Public Subnet and a private subnet named as Private Subnet in the same VPC.
![VPC](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/VPC.png)
![Internet Gateway](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/IWGattachedtovpc.png)
![Public and Private Subnet](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/Public%20and%20Private%20SUbnet.png)
![Route Table for Public subnet](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/routetablesforpublicsubnet.png)

Task 2
Create two instances within the vpc that you created in task 1, windows instance in public subnet and linux instance in private subnet. check if linux is pingable from windows and vice versa.
#Created 2 instances , 1st was a Windows instance which i created in Public Subnet and 2nd was a linux instance. 
#First they were not pingable but after allowing ICMP in security groups of both instances they were pingable 
![windos and linux instances](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/instances.png)
![pingable](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/pingaftericmp.png)
Task 3
Delete all the instances and now make those two instances that you created in previous task using aws-cli.
Deleted above 2 created instances and setup aws cli using following commands.
#sudo apt-get install awscli
#aws –version
#aws configure (Add your access key, secret key, region code , output format)
#cd .aws/
#vim config
#sudo chmod 600 ~/.aws/config
#ssh-keygen -t rsa -f ~/.ssh/ec2
#aws ec2 import-key-pair --key-name my-ec2-key --public-key-material "$(cat ~/.ssh/ec2.pub)"
To create a security group for both instances
#aws ec2 create-security-group --group-name securitygroup --description "Security Group for all instances" --vpc-id vpc-06a7539946657cccd
To create a windows instance in public subnet
#aws ec2 run-instances --image-id  ami-5f95bd30 --count 1 --instance-type t2.micro --security-group-ids sg-014d5e3176448918b --subnet-id subnet-0b8092702f252b45f
![Windows Instance](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/publicinstanceusingcli.png)
To create a linux instance in private subnet
#aws ec2 run-instances --image-id ami-76d6f519 --count 1 --instance-type t2.micro --security-group-ids sg-014d5e3176448918b --subnet-id subnet-091d2103223e51110
![Linux Instance](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/privateinstanceusingcli.png)
![Verification](https://github.com/tarungoel1995/assignments/blob/master/AWS/day1/media/instancescreatedusingcli.png)