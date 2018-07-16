
What Is Puppet?

-Puppet is a Configuration Management tool that is used for deploying, configuring and managing servers. It performs the following functions:

-Defining distinct configurations for each and every host, and continuously checking and confirming whether the required configuration is in place and is not altered (if altered Puppet will revert back to the required configuration) on the host. 
Providing control over all your configured machines, so a centralized (master-server ) change gets propagated to all, automatically. 

-Puppet uses a Master Slave architecture in which the Master and Slave communicate through a secure encrypted channel with the help of SSL.

How Puppet Works?

-Puppet uses a Master-Slave architecture.

-The Puppet Agent sends the Facts to the Puppet Master. 

-Facts are basically key/value data pair that represents some aspect of Slave state, such as its IP address, up-time, operating system.

-Puppet Master uses the facts to compile a Catalog that defines how the Slave should be configured. Catalog is a document that describes the desired state for each resource that Puppet Master manages on a Slave.

-Puppet Slave reports back to Master indicating that Configuration is complete, which is visible in the Puppet dashboard. 


Components of Puppet

Manifests: Every Slave has got its configuration details in Puppet Master, written in the  Puppet language. These details are written in the language which Puppet can understand and are termed as Manifests. They are composed of Puppet code and their filenames use the .pp extension. These are basically Puppet programs. 
For example: You can write a Manifest in Puppet Master that creates a file and installs Apache server on all Puppet Slaves connected to the Puppet Master.

Module: A Puppet Module is a collection of Manifests and data (such as facts, files, and templates), and they have a specific directory structure. Modules are useful for organizing your Puppet code, because they allow you to split your code into multiple Manifests. Modules are self-contained bundles of code and data.

Resource: Resources are the fundamental unit for modeling system configurations. Each Resource describes some aspect of a system, like a specific service or package.



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



