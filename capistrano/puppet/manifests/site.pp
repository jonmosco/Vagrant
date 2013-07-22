#
# Setup our source and destination server for Capistrano
# testing
#
node 'source.forkedprocess.com' {
  exec { 'apt-get update':
    path => '/usr/bin',
  }

}

node 'dest.forkedprocess.com' {

  $packages = [ 'apache2', 'git', 'subversion' ]

  exec { 'apt-get update':
    path => '/usr/bin',
  }

  package { $packages:
    ensure  => installed,
    require => Exec['apt-get update'],
  }

}
