Assignment 2 Ansible

The Assignment
Perform the following operations using ad-hoc commands and ansible modules :
1. Fetch and display to STDOUT Ansible facts using the setup module.
# ansible all -m setup --tree /tmp/facts
2. Fetch and display only the "virtual" subset of facts for each host.
#ansible all -m setup -a 'gather_subset=virtual'
3. Fetch and display the value of fully qualified domain name (FQDN) of each host from their Ansible facts.
# ansible all -m setup --tree /tmp/facts | grep fqdn
4. Display the uptime of all hosts using the command module.
# ansible all -m command -a “uptime”
link: https://github.com/tarungoel1995/assignments/blob/master/ansible/day2/media/limitedpinganduptime.png
5. Ping all hosts except the 'control' host using the –limit option
# ansible all -m ping --limit 'all:!devops'
link: https://github.com/tarungoel1995/assignments/blob/master/ansible/day2/media/limitedpinganduptime.png
6. Setup Java8 on the hosts in the "App" group using the apt module.
# ansible main -m apt_repository -u root -a "repo=ppa:webupd8team/java"
# ansible all -m command -a "sudo apt-get update"
# ansible all -m apt -u root -a "name=oracle-java8-installer state=present"
7. Setup and enable the EPEL package repository on the hosts in the "web" group using the yum module.
CentOS systems use the latest epel-release package
RHEL systems should use https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
Create inventory groups app and web
# ansible centos -m yum -a "name=epel-release state=present"
# It is enabled by default
# I have already created two groups devops and ninja in my inventory file.
8. set a cron on ansible control machine that will run every 1 minute , and perform below tasks:-
execute ansible adhoc commands on client machines (cannot be control machine) , to create a file in /var/log/ninja_name on all the client nodes, append system_hostname [:space:] system_time in the file every 1 minute using ansible facts.
# (Pending, still working on this problem)
