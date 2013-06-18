# Turn off selinux
#
class selinux {
    file { '/etc/selinux/config':
      source => 'puppet:///modules/selinux/config',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }

    exec { 'setenforce 0':
      path        => '/usr/sbin/',
      subscribe   => File['/etc/selinux/config'],
      refreshonly => true,
    }
}
