Assignment 1




Use pip to install the ansible package and its dependencies to your control machine.
# sudo apt-get install python-pip -y
# pip install jinja2
# pip install pyYAML
# pip install ansible
link: https://github.com/tarungoel1995/assignments/blob/master/ansible/day1/media/pipansible.png
1. Display the Ansible version and man page to STDOUT.
# ansible –version
output: https://github.com/tarungoel1995/assignments/blob/master/ansible/day1/media/ansibleversion.png
2. Check all the possible parameters you need to know in ansible.cfg file.
#Inventory File Path: /etc/ansible/hosts
# Roles Path: /etc/ansible/roles
# Host Key Checking: False
# Remote user: root
# Log Path: /var/log/ansible.log
# Plugins Path: /usr/share/ansible/plugins/*
# retry_files_save_path: ~.ansible-retry

3. Ansible Inventory: Check the default inventory file for ansible control master and use inventory, run ansible ping commands on various inventory groups. Try this on minimum of two virtual machines.(You can use any of these Docker/Vagrant)
# sudo vim /etc/ansible/hosts
#inserted the following
[devops]
192.168.0.87
[opstree]
192.168.33.19
# ansible -m ping devops
# ansible -m ping opstree
ouput: https://github.com/tarungoel1995/assignments/blob/master/ansible/day1/media/groupping.png
4. In ~/.ansible.cfg file (create the file if it doesn't exist already) do the following:
Create a new directory ~/.ansible/retry-files and set retry_files_save_path to it.
Set the Ansible system forks to 10
# cd ~/.ansible/
# mkdir retry-files
# cd ~/
# touch ~/.ansible.cfg
# vim ~/.ansible.cfg(add the following in the file)
	[defaults]

	retry_files_enabled = True
	retry_files_save_path = ~/.ansible/retry-files
	forks = 10
	# esc+:wq (save and exit)

Problem statement: Using Adhoc command

	- Host a static website on minimum three hosts using inventory, content of static website is "Index page of Ansible assignment"
Document root /opt/html

# Added 3 hosts in inventory file under 3 different groups devops, opstree, ninja.
# I was not able to find any index file in Ansible Assignment so created my own index.nginx-debian.html in /etc/ansible/
# ansible ninja -a "sudo apt-get install nginx -y"
# ansible opstree -a "sudo apt-get install nginx -y"
# ansible devops -a "sudo apt-get install nginx -y"
# ansible ninja -m copy -a "src=/etc/ansible/index.nginx-debian.html dest=/var/www/html/"
# ansible opstree -m copy -a "src=/etc/ansible/index.nginx-debian.html dest=/var/www/html/"
# ansible devops -m copy -a "src=/etc/ansible/index.nginx-debian.html dest=/var/www/html/"
# ansible devops -a "sudo systemctl restart nginx"
# ansible ninja -a "sudo systemctl restart nginx"
# ansible opstree -a "sudo systemctl restart nginx"



- First do this manually and then with jenkins using ansible plugin or execute shell.
- only use ansible modules.
# Also done the same using ansible playbook
# ansible-playbook nginx.yml
Playbook link: https://github.com/tarungoel1995/assignments/blob/master/ansible/day1/nginx.yml
Output link: https://github.com/tarungoel1995/assignments/blob/master/ansible/day1/media/nginxplaybookoutput.png
Using Jenkins Job:https://github.com/tarungoel1995/assignments/blob/master/ansible/day1/media/Screenshot%20from%202018-06-11%2020-08-13.png
configuration link:  

