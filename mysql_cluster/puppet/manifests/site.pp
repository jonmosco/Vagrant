node 'db.forkedprocess.com' {

  class { 'mysql::server':
    config_hash => { 'root_password' => 'vagrant' }
  }

}

node 'web.forkedprocess.com' {

  class {'apache':  }

}
