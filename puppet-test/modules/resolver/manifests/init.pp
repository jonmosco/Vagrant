###############################################################################
#
# resolv.conf configuration for Vagrant Boxes
#
###############################################################################
#
class resolver {
  file { '/etc/resolv.conf':
    ensure => present,
    source => 'puppet:///modules/resolver/resolv.conf',
  }
}
