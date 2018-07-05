Assignment 7 AWS


Task 1
Rajat is the devops guy in 'abc' organization and he is responsible for creating 't2.micro' and all the 'm' family of instances as per requirement but he can't terminate 'm' family of instances but that's not the case with t2.micro. Tejasvi Rana has got root access to the account but he isn't a technical guy. He is always suspicious about Rajat's actions in company's aws account. Luckily Tejasvi has got a friend, Priyanka jugran, she is amazon certified and knows everything about aws. Tejasvi wants Priyanka to cross check rajat's IAM permissions. In order to do that, he gave priyanaka full access. Now priyanka needs s3 storage for one of her friend, priyanka sharama to run athena queries for data analysis,they don't want to pay for that from their own aws account. Jugran has created a bucket with name 'abc-data' with a policy that sharma will only be able to access this bucket from a particular ec2 instance that she created & provided the user details to sharma. Rajat referenced his friends kavit and vishwas to his organization and now all of then share the same permission level. Kushgra is also one of the team memebers from operations team but recently he has got a task to create and run lambda function that is going to access rds database. 

Solution for First Scenario

#Creted a user Priyanka juglan and attached root access permission with the user.

![ROOT ACCESS](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/rootaccess.png)

#created 4 other users (Rajat, Kavit, Vishwas, Kushgra)

![users](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/users.png)

#Only 1 group i.e. devops gets created which include users (Rajat, Kavit, Vishwas, Kushgra)

![Group with users added](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/Groupwithusers.png)

#created 2 policies 

#First Policy to allow user to do evreything with t2.micro and m-family instances. In this manner members of group devops won’t be able to lanuch any other type of instance other than above mentioned.

![allow policy](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/t2andm5launchaccess.png)

	
#2nd policy to deny the termination of m-family instances and attached the policy to devops group

![denytermination policy](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/mfamilyterminationdenied.png)

#attached these policies to the group devops

![group permissions](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/group%20pemissions.png)

#verification launch denied for instances other then t2.micro and m-family
	![launch denied](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/launchdeny.png)

#verification termination deined  for instances of  m-family

![termination denied](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/mfamilydenied.png)


Solution for second scenraio

#Priyanka Juglan creates a role, which include an inline policy only to give access to a specific bucket.

![role policy](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/role-policy.png)

#this role is attached to an EC2-instance during launch and pem keys are given to Priyanka Sharma so that she can access only a specific bucket.

#Verfication Priyanka Sharma got only access to specific bucket.

![bucket access](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/P.S%20bucketaccess.png)

Solution for third scenraio

#Attached lambda full access to user khusgra

![lambda access](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/lambdaaccess.png)

#created a role which gives  access to lambda service to call RDS service

![RDS access role](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/RDSaccess%20role.png)

#Verification Kushgra user have access to lambda service by creating a Lambda function and attaching RDSaccess role to this function

![lambda function](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/Lambdafunction.png)

#verification RDS access

![rds access](https://github.com/tarungoel1995/assignments/blob/master/AWS/day7/media/rdsverification.png)

