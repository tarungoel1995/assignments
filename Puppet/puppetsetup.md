Puppet master slave setup

#on puppet master (centos7)
- sudo su
- rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
- yum install puppet-server

#on puppet slave (centos7)
- sudo su
- rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
- yum install puppet

#on msater
- vim /etc/hosts (and add a entry )

[172.2.0.2  puppet puppet.master.co]

- vim /etc/puppet/puppet.conf (add entry in master section)

[    dns_alt_names = puppet,puppet.master.co

certname=puppet]

- service puppetmaster start

#on slave 
-vim /etc/hosts

192.168.33.62 puppetagent

192.168.33.61 puppet puppet.master.co

- vim /etc/puppet/puppet.conf (on agent section)

server = puppet.master.co

- service puppet start

#on master
- service puppetmaster stop
- sudo -u puppet puppet master --no-daemonize –verbose
-ctrl+c
- puppet resource service puppetmaster ensure=running
- service puppetmaster status

#on slave
-service puppet stop
- puppet agent -t

#on master
-puppet cert list
-puppet cert sign localhost.dlink
 
#on slave
- puppet resource service puppet ensure=running
- service puppet status
- puppet agent –fingerprint
- puppet agent -t





SAMPLE JAVA and TOMCAT

#on master
- puppet module install puppetlabs-java
- vim /etc/puppet/manifests/site.pp
```
class { 'java' :
  package => 'java-1.8.0-openjdk-devel',
}
```
- puppet module install puppetlabs-tomcat
-vi /etc/puppet/manifests/site.pp
```
class { 'java' :
  package => 'java-1.8.0-openjdk-devel',
}
tomcat::install { '/opt/tomcat':
 source_url => 'http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz',
}
tomcat::instance { 'default':
   catalina_home => '/opt/tomcat',
}
```

#on slave
-puppet agent -t

