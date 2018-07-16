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
