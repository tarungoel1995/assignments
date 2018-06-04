DAY 4 JENKINS

Assignment 1

Install Jenkins using package.
# sudo add-apt-repository ppa:webupd8team/java
            # sudo apt-get update
            # sudo apt-get install oracle-java8-installer
            # sudo apt-get install oracle-java8-set-default
            # vim /etc/environment
		(JAVA_HOME=/usr/lib/jvm/java-8-oracle 
		JRE_HOME=/usr/lib/jvm/java-8-oracle/jre)
            Install jenkins now
		# wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
		# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > 							        /etc/apt/sources.list.d/jenkins.list'
		# sudo apt-get update
		# sudo apt-get install jenkins
 
 Run jenkins war on the top of a tomcat server.
Steps:- #Download Tomcat
#Unzip and place tomcat folder at any location.
#Copy/Place jenkins.war file inside tomcat/webapps folder
# go to tomcat/bin directory
#make all files exectable: chmod +x *.sh
# start tomcat:- ./startup.sh
#verify if tomcat started:- http://localhost:8080
# verify if jenkins is running on tomcat:-
http://localhost:8080/jenkins
Assignment 2
Install any five plugin and use them. 
1. git plugin
2. git parameter
3. Role-based authorization strategy
4. slack

Install a plugin manually.
# wget https://updates.jenkins.io/latest/ansible.hpi
# go to http://localhost:8080
# go to manage jenkins-> manage plugins -> advanced options
# upload the downloaded ansible.hpi file 

Assignment 3
Create a freestyle job to print "Hello world". 













Create a freestyle job to which take absolute path of a directory then 
1. List all files and directories inside that. 



2. Print a message "drectory not exist" if directory doesn't exist on file system 
















3. Print "Inappropriate permissions" if you don't have permissions to list files. 















Create a job to clone your jenkins repo and cat a file from it. 




Assignment4:
Increase and decrease number of executors and observe the build queue. 
Increase executers to 7.

           Decrease the size to 4
