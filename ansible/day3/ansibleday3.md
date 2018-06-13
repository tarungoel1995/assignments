Assignment 3 Ansible

The Assignment
1. Create and delete ninja directory on host machine
# ansible main -a "mkdir /tmp/demo"
# ansible main -a "rmdir /tmp/demo"
2. Set hostname on all nodes from remote machine.
# ansible all -m command -a “sudo hostname tarun”
3. Fetch os of all nodes and store o/p into a file, use min two different machine of different flavour of os.
#  ansible all -m command -a "cat /etc/os-release > /home/vagrant/os_family"
4. Add three group into hosts file through ansible module.
     Debian ( ip of debian machine)
          Centos ( ip of centos machine)
          All ( ip of all nodes )
	# ansible localhost -m lineinfile -u root -a "path=/etc/ansible/hosts line=[Debian]\n192.168.33.19\n[Centos]\n192.168.33.71\n[All]\n192.168.33.19\n192.168.33.71"
Problem statement: Using Adhoc command
Step 1:
    * Install apache on Debian machine
	# ansible devops -m apt -u root -a “name=apache2 state=present”
    * Cross check apache isntalled or not from remote machine
# ansible devops -m command -a “sudo systemctl status apache2”
    * Apache runn  on 8082 port
# ansible Debian -m lineinfile -u root -a "path=/etc/apache2/ports.conf regexp='^(.*)listen 80(.*)$' line='listen 8082'"
    * Create two virtual host
    * Restart apachefrom remote machine
# ansible 
Step2:
   * Install nginx on centos machine
   * Nginx run on 8080 port.
# ansible centos -m yum -a “name=epel-release state=present”
# ansible centos -m yum -a "name=nginx state=present"
# ansible centos -m lineinfile -a "path=/etc/nginx/nginx.conf regexp='^(.*)listen       80 default_server;(.*)$' line='listen       8080 default_server; '"
# ansible centos -m command -a "sudo service nginx start"
Step3:
   * Configure Nginx - configure it to run as reverse proxy to apache
(pending,still working on this problem)
