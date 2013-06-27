node 'db.forkedprocess.com' {

  package { 'mysql-server':
    ensure => present,
  }

}

node 'web.forkedprocess.com' {

  package { 'httpd':
    ensure => present,
  }

}
