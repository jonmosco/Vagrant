# Testing configuration
#
# Apache and MySQL deployment for testing Rails
#
node 'db.forkedprocess.com' {

  class { 'firewall': }

  firewall { '101 allow remote mysql access':
    port   => 3306,
    proto  => tcp,
    action => accept,
  }

  # Install MySQL server and start the service
  class { 'mysql::server':
    config_hash => { 'root_password' => 'vagrant' }
  }

  mysql::db { 'massiveapp_production':
    user     => 'root',
    password => 'vagrant',
    host     => 'web.forkedprocess.com',
    grant    => ['all'],
    require => Class['mysql::server'],
  }

  package { 'bundler':
    ensure   => present,
    provider => gem,
  }

}

node 'web.forkedprocess.com' {

  class { 'mysql': }

  class { 'firewall': }

  firewall { '100 allow http and https access':
    port   => [80, 443],
    proto  => tcp,
    action => accept,
  }

  # Install mysql client
  class { 'apache':  }

}
