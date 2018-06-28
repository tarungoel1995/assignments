Assignment 3 AWS

Task 1
Create a linux t2.micro ec2 instance. After logging into this instance move /etc/sudoers file with /etc/sudoers.bkp
Now try to login, If can't - resolve this issue
```Steps: #Launch a new linux t2.micro ec2 instance. Take SSH login into same.
 #mv /etc/sudoers /etc/sudoers.bkp
#when i try to to sudo su, iwas getting this error
```
![errror](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/error.png)

```#to resolve this issue i created a new instance and stopped the instance in which error was coming.
```
![recovery instance](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/instances.png)

```#dettach the vloume of old instance and attach the same volume with new instance.
```

![volumesection](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/volumes.png)

```#SSH login in new instance and create a recovery  directory in / which will work as a mount point for extra volume. And preformed the following steps:
```

![mount](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/mountingerrormachinevolume.png)

![moving the file and again unmonting the volume](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/movingsudoersfileandunmounting.png)

```#Dettach the volume from the recovery instance and attach the vloume to old instance and when SSH login in old instance issue is resolved.
```

![recovered](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/recovered.png)


Task 2

create an ansible role before pushing the same to your public github repository.
This Role will simply host an nginx webpage saying
"Hi i am ninja and my name is {yourname}" 
Execute this role in user data script while launching another instance
Your website should be up & running after the system boots up
```nginx role link: https://github.com/tarungoel1995/AWSROLES
```
```User data script:

#!/bin/bash
sudo su
cd /
apt-get update -y
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible
apt-get update -y
apt-get install ansible -y
apt-get install git -y
git clone https://github.com/tarungoel1995/AWSROLES.git
cd AWSROLES
ansible-playbook main.yml
```

![nginx server](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/day3-task2.png)


Task 3

write a jobDsl to start stop this instance through jenkins
```#Job will take 2 parameters StarStop and Instanceid and will perform respective actions.
DSL:
job('INSTANCESTARTSTOP') {
   parameters
{
  stringParam('StartStop', '')
  stringParam('Instanceid', '')
} 
  steps {
  shell('''
#!/bin/bash
if [ $StartStop = Stop ]
then
aws ec2 stop-instances --instance-ids $Instanceid
elif [ $StartStop = Start ]
then
aws ec2 start-instances --instance-ids $Instanceid
fi
''')
        
}
}
```

![joboutput](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/startjenkin.png)


![console output](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/startedbyjenkin.png)


![stopped](https://github.com/tarungoel1995/assignments/blob/master/AWS/day3/media/stoppedbyjenkinjob.png)

