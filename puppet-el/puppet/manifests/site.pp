###############################################################################
#
# Default Site Manifest
# - Sets up our Puppet test server
# - Test modules
#
###############################################################################

node 'vtest1.forkedprocess.com' {
  include resolver, selinux

  # Apache Module
  # Install Apache
  #class {'apache': }

  # base packages
  $base_packages = [ 'git', 'nmap' ]

  # install base packages
  package { $base_packages:
    ensure  => present,
    require => Class['resolver'],
  }
}
