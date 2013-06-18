###############################################################################
#
# Default Site Manifest
# - Sets up our Puppet test server
# - Test modules
#
###############################################################################

node 'vtest1.forkedprocess.com' {
  # include resolver

  # Apache Module
  # Install Apache
  #class {'apache': }

  #  resources { 'firewall':
  #      purge => true
  #  }
  #
  #  Firewall {
  #      before    => Class['my_fw::post'],
  #        require => Class['my_fw::pre'],
  #  }
  #
  #  class { ['my_fw::pre', 'my_fw::post']: }

  class { 'firewall': }

  firewall { '100 allow http and https access':
    port   => [80, 443],
    proto  => tcp,
    action => accept,
  }

  # base packages
  $base_packages = [ 'git', 'nmap' ]

  # install base packages
  package { $base_packages:
    ensure  => present,
    #  require => Class['resolver'],
  }

  # Not sure why this isnt working...
  #  exec { 'yum update -y':
  #    command => '/usr/bin/yum',
  #    require => Class['resolver'],
  #  }

  package { 'httpd':
    ensure  => installed,
    require => Class['resolver'],
  }

  file { '/var/www/html':
    ensure  => link,
    target  => '/vagrant/www',
    force   => true,
    require => Package['httpd'],
  }

  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => File['/var/www/html'],
  }
}
