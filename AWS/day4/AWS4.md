Assignment 4 AWS

Task 1
Lauch 3 instances with the following tags respectively
Name: nginx, boot-order: 1 
Name: myapp, boot-order: 2 
Name: mydb, boot-order: 3 

#Launched 3 instances using image ubuntu from AWS console

![Instances](https://github.com/tarungoel1995/assignments/blob/master/AWS/day4/media/3Instances.png)

Task 2

write a script that would start/stop these instances in the order you specified, i.e.
instance with boot-order: 3 tag should boot/start first and likewise rest of them 

#Script Link:

https://github.com/tarungoel1995/assignments/blob/master/AWS/day4/withstatus/statusstartinstance.sh

Output:

![Output](https://github.com/tarungoel1995/assignments/blob/master/AWS/day4/media/instancestarting.png)

#console output

![Console Output](https://github.com/tarungoel1995/assignments/blob/master/AWS/day4/media/instancestarted.png)

instance with boot-order: 1 tag should stop first and likewise rest of them 

#Script Link:

https://github.com/tarungoel1995/assignments/blob/master/AWS/day4/withstatus/statusstopinstance.sh

Script Output:

![Output](https://github.com/tarungoel1995/assignments/blob/master/AWS/day4/media/instancestopping.png)

#Console Output:

![Console Output](https://github.com/tarungoel1995/assignments/blob/master/AWS/day4/media/instancestopped.png)

Task 3

Launch an ec2 instance with user-data having ansible role to host a website - [like previous assignment]
Figure out a way to launch this instance in your friend's AWS account
(Pending, will update as soon as completed)
