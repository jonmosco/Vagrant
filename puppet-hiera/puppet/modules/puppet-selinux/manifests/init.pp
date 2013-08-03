# Selinux Module
#
# Options:
# - Enabled
# - Disabled
# - Permissive
#
# Policy options:
# - targeted
# - strict
#
class selinux (
  # set the default mode to disabled
  $mode   = 'disabled',
  $policy = 'targeted',
) {

  validate_string($policy)
  validate_re($mode, [ '^enabled' '^disabled' '^permissive' ])

  file { 'config':
    ensure   => file,
    path     => '/etc/selinux/config',
    template => template('selinux/config.erb'),
  }

}
