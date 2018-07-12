class httpd{
  package { 'httpd':
    ensure => present,
  } ->
  file { "/var/www/html":
    ensure => "directory",
    owner => "root",
    group => "root",
    mode => 750,
  } ->
 file { '/var/www/html/index.html':
  ensure => file,
  content => "Index HTML is Managed by Puppet Master",
  mode => '0644',
  } ->
 file { '/etc/httpd/conf.d/welcome.conf': 
      ensure => file,
      mode   => '0600',
      source => 'puppet:///modules/httpd/welcome.conf',
   } ~>
    service { 'httpd':
      ensure => running,
      enable => true,
    }
}

