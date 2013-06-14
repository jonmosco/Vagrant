###############################################################################
#
# Default Manifest
# - Sets up our Puppet test server
#
###############################################################################

include resolver

# base packages
$base_packages = [ 'git', 'nmap' ]

# Install apache
package { 'httpd':
  ensure  => present,
  require => Class['resolver'], 
}

service { 'httpd':
  ensure  => running,
  require => Package['httpd'],
}

# mysql server
#package { 'mysql':
#  ensure  => present,
#  require => Class['resolver'],
#}
#
#service { 'mysqld':
#  ensure  => running,
#  require => Package['mysql'],
#}

# install base packages
package { $base_packages:
  ensure  => present,
  require => Class['resolver'],
}
