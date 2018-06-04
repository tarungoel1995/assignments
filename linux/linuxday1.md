Assignment 1

Task 1 :- Install and configure Apache2.
 Steps  :-         # sudo apt-get insatll apache2 
                           # systemctl status apache2.service (should be active)
                           # cd /var/www/html
                           # vim index.html (hi! I am devops ninja)
                           # ipaddress:80 (to confirm)
 
Task 2 :- Install and configure nginx – configure it to run a                  proxy to apache.
Steps  :-    # sudo  apt-get install nginx (By default nginx runs on port 80 which is already                                                being used by Apache2)
                           # cd /etc/apache2
                           # vim ports.conf (changed the port to 81)
                           # vim /etc/nginx/sites-available/defaults
                           # mv defaults proxytest (changed the file defaults to proxytest)
                           # vim proxytest 
( server {
listen 80;
server_name proxy_test.com;
location / {
proxy_pass http://192.168.33.12:80}} )
                              # ln -s /etc/nginx/sites-available/proxytest proxytest
                              # vim /etc/host ( add – 192.168.33.12 proxytest.com )
                              # 192.168.33.12:81 (nginx is working as a proxy server of apache2.)

Task 3 :- Install & Configure ntp with singapore timezone.
Steps    :- # sudo apt-get install ntp
                         #vim /etc/ntp.conf(comment already defined pools and add pools according to singapore timezone )
                          #sudo systemctl start ntpd
 Note:- (Configuration not complete still working on this)
                         

Task 4,5 :- Install Java version 8 and tomcat version 8.
Steps    :- 1. Java 8
                 # add-apt-repository ppa:webupd8team/java
                          # apt-get update
                          # apt-get install oracle-java8-installer  -y
                          # update-alternatives  --config java
                          # vim /etc/environment ( JAVA_HOME=”/usr/lib/jvm/java-8-oracle/jre”) 
                             # vim ~./bashrc ( export java home and path)
                             # source ~/.bashrc
                 # echo $JAVA_HOME

                  2. Tomcat 8      
                  # wget http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.31/bin/apche-tomcat-8.5.31.tar.gz
                          # cd /opt/tomcat
                          # tar xzvf apache-tomcat-8.5.31.tar.gz -C /opt/tomcat
                          configured tomcat – Created tomcat group and user
                                                              Test apache tomcat on 8080 by config. ~/bashrc
                                                             Setup Apache tomcat.service
                                                             Config. Apache tomcat user in /opt/tomcat/conf/
                                                             Edited users.xml & context.xml
                                                             Testing tomcat
Reference Link : https://www.howtoforge.com/tutorial/how-to-install-apache-tomcat-8-5-on-ubuntu-16-04/


Task 5 :- Install build-essential.
Steps    :-  # sudo apt-get install build-essential
Why we need build-essentials?
1. This package is recquired for building debian-packages.
2. If you have this package installed, you only need to install whatever a package specifies as its build-time dependencies to build the package. Conversely, if you are determining what your package needs to build-depend on, you can always leave out the packages this package depends on.
3. This package consist of various tools :- dpkg-dev, g++, gcc, libc-dev, etc.
4. This package provides the c, c++ environment.


Task 6 :- Install logrotate & rotate tomcats catalina.out logs.
Steps    :- # sudo apt-get install logrotate 
                        # cd /etc/logrotate.d
                        # vim tomcat 
( /opt/tomcat/apache-tomcat-8.5.31/logs/catalina.out
{
weekly
rotate 5
create
size 500K
compress
delay compress
}
                        # logrotate -f /etc/logrotate.conf




Task 7 :- Install git.
Steps    :- # sudo apt-get install git

What is git?
Git is a piece of software that allows you to perform version control. Large software projects require some piece of software to keep track of all the different changes made to a code base in order to track things like: Who edited a certain file; what they changed; and how to get back to the original code if necessary. Git does all of these things and more, so it's not surprising that most large software companies use git

Why we need git?
If you accidentally delete your code, using git can help you get it back.
If you accidentally change your code and break something, git can revert it.
Git lets you share and exchange code with other developers easily.
If you want to know what recent changes you made to you code, git will show you.
Git lets you backup your code easily to a remote server.
Many more things


Task 8 :- Mention the log files
1. Apache - /var/log/apache2(access.log, error.log)
2. Nginx - /var/log/nginx(access.log, error.log)
3. Ntp - /var/log/ntpstats
4. Tomcat - /opt/tomcat/apache-tomcat-8/logs/catalina.out
5. Java - /var/log

Task 9 :- Mention the files created after installation
1. Apache – apache2
2. Nginx – nginx
3. Tomcat – apache-tomcat-8.5.31



Task10:- Shell Script task
Script:- #!/bin/bash
              	  name='tarun'
              	  echo "$name ,hello"
                    echo "hello , $name"
              	  printf "Hello, $name \nHow are you?\n"

                           
                           
 