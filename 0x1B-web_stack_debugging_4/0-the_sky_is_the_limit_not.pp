# fixing nginx to handle extra request for open file

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
  before   => Package['nginx'],
}

exec {'nginx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx'
  before   => Service['nginx'],
}

service {'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
  before  => File['/etc/default/nginx'],
}

exec {'/etc/default/nginx':
  command  => 'sudo echo "ulimit -n 1048576" | sudo tee -a /etc/default/nginx; sudo service nginx restart',
  provider => shell,
}
