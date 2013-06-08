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

# install base packages
package { $base_packages:
  ensure  => present,
  require => Class['resolver'],
}
