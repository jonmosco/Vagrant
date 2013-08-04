# Base Linux Server Profile
#
# Include Classes that will define the base configuration
# for all linux servers
#
class profile::linux::base {

  # selinux config
  include puppet_selinux

  firewall { '100 allow http and https access':
    port   => [80, 443],
    proto  => tcp,
    action => accept,
  }

}
