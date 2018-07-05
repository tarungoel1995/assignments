Assignment 8 AWS

Task 1
Create an infrastructure that would scale as per load: Create cloudwatch alarms for scaling up and scaling down along with sns topic to notify you during any scaling operation
Put fake load on the stack 
scale up if av. cpu threashold > 70 
scale down if av. cpu threashold < 40

# Created an ami for launch configuration

![snapshot of ami](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/snapshotsofami.png)

# launch configuration 

![launch configuration](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/launchconfiguration.png)

# created auto scaling group and set scaling up and scaling down policies i.e. scale up when cpu threashlold >70 and scale down when cpu threashold < 40

![auto scaling group](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/auto-scaling-group.png)

#verification applied fake load

![fake load(https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/fake%20load.png)

#auto scaleup alarm

![scale up alarm](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/Autoscaleupwithnotificaton.png)

#auto scale up of instance

![auto instance created](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/auto-scaled-instance.png)

#auto scaling up notification

![scale up notification](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/autoscaling-notification.png)

#as the maximum limit of instances was set to 5 and cpu utilisation was above 70% instanes got scaled up further.
#4th instance scale up

![4th instance](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/2nd%20auto%20scaled%20instance.png)

#Verification of Auto scale down by removing the fake load

![fake load removal(https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/removaloffakeload.png)

# Auto scaling down alarm

![scale down alarm](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/scale-down-alarm.png)

#Scaled down instance

![scaled down](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/auto-scale-down-instance.png)

#scale down notification

![notification scale down](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/termination-notification.png)

#back to normal to the minimum limit 

![back to normal](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/back-to-normal-instance.png)
