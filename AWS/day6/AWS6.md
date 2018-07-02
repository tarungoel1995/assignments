Assignment 6 AWS

Task 1
Host a static website using s3 as follows:
Buy a domain from Freenom as yourname.opstree.com 
 	example: yashvinderopstree.com
 	#created a domain named tarun-opstree.tk
	![free domain](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/domain.png)
Migrate this domain to Route53
#created a hosted zone
![hosted zone with name servers](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/hostedzonewithnameservers.png)
#added the name servers in the main registrar
![adding name servers to the registrar](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/customnameservers.png)
#dig +trace www.tarun-opstree.tk (to verify the nameservers are added successfully )
![verification](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/digsite.png) 
Host a static website using s3 bucket 
#created 2 buckets with name same as domain name tarun-opstree.tk and www.tarun-opstree.tk. 2nd bucket can redirect all the requests to tarun-opstree.tk
#added index.html in tarun-opstree.tk bucket
#make both the buckets publically readable
#verify index.html using index.html url
	![mainbucket](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/index.html.png)
	![redirectbucket](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/redirectbucket.png)
	![verification](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/bucketurlverification.png)
	#create set records for tarun-opstree.tk
	![set record for main server](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/mainsetrecord.png)
	#create set records for www.tarun-opstree.tk
	![set record for redirect server](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/redirectrecordset.png)
	#verification
	![hosting](https://github.com/tarungoel1995/assignments/blob/master/AWS/day6/media/staticwebsite.png)
	