# Base Linux Server Profile
#
# Include Classes that will define the base configuration
# for all linux servers
#
class profile::linux::base {

  # selinux config
  include selinux
}
