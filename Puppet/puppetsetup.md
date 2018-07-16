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
[192.168.33.61  puppet puppet.master.co]
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





SAMPLE

1. Installing httpd package on slave using manifest 
```
#on puppet master
#cd /etc/puppet/manifests/
#vim site.pp (add the following content)
```
```
node default {
package { 'httpd':
ensure => installed,
} ->
service { 'httpd':
ensure => running,
enable => true,
}
}
```
```
#on puppet agent node
#puppet agent -t (you should see output as below)
```
![httpdinstallation](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/httpdserviceusingmanifest.png)

Verification
```
#service httpd status
```
![httpd status](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/httpdstatusmanifest.png)

Browser Verification

![httpd verification](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/httpdhomepagemanifest.png)


2. Installing vim using puppet modules

```
on puppet master machine
#go to https://forge.puppet.com from your browser and search for your module select any one, you will see a download command copy and paste it into your puppet master terminal.
#puppet module install saz-vim --version 2.7.0

![vim module install](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/vimModuledownload.png)

```
```
#cd /etc/puppet/modules/vim
#ls
```
![vim directory conetnt](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/vimmodulecontent.png)

```
#cd /etc/puppet/manifests
#vim site.pp (add the follwing content)
```
```
node default {
class { 'vim':
}
}
```

on puppet agent
```
#puppet agent -t
```

![vim installation](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/viminstallusingmodule.png)


3. Installing nginx using puppet custom modules

on puppet master 

```
#cd /etc/puppet/modules
#mkdir nginx
#cd nginx
#mkdir manifests files
#cd manifests 
#vim init.pp (add the following content)
```
```
class nginx{

  package { 'epel-release':
  ensure => present,
  } ->
  package { 'nginx':
    ensure => present,
  } ->
  file { "/var/www/html":
    ensure => "directory",
    owner => "root",
    group => "root",
    mode => 755,
  } ->
 file { '/var/www/html/index.html':
  ensure => file,
  content => "Index HTML is Managed by Puppet Master",
  mode => '0644',
  } ->
 file { '/etc/nginx/nginx.conf':
      ensure => file,
      mode   => '0600',
      source => 'puppet:///modules/nginx/nginx.conf',
   } ~>
    service { 'nginx':
      ensure => running,
      enable => true,
    }
}
```

```
#cd ../files (add the nginx.conf file)
```

link : https://github.com/tarungoel1995/assignments/tree/master/Puppet/nginx/files

on puppet agent

```
#puppet agent -t
```

![installation](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/nginxinstalltionmodule.png)

Verification

![service verification](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/servicestatusmodule.png)

Browser Verification

![browser verification](https://github.com/tarungoel1995/assignments/blob/master/Puppet/media/nginxusingmodule.png)


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
