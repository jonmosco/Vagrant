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
class puppet_selinux (
  # set the default mode to disabled
  $mode   = 'disabled',
  $policy = 'targeted',
) {

  validate_string($policy)
  validate_re($mode, [ '^enforcing', '^disabled', '^permissive' ])

  file { 'config':
    ensure   => file,
    path     => '/etc/selinux/config',
    content  => template('puppet_selinux/config.erb'),
  }

}
