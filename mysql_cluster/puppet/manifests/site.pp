# MySQL Cluster
#
node 'db.forkedprocess.com' {

  class { 'firewall': }

  firewall { '101 allow remote mysql access':
    port   => 3306,
    proto  => tcp,
    action => accept,
  }

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

}

node 'web.forkedprocess.com' {

  class { 'mysql': }

  class { 'firewall': }

  firewall { '100 allow http and https access':
    port   => [80, 443],
    proto  => tcp,
    action => accept,
  }

  class {'apache':  }

}
