# fixing nginx to handle extra request for open file

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
  before   => Exec['nginx'],
}

exec {'nginx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
  before   => Service['nginx'],
}

service {'nginx':
  ensure => running,
  enable => true,
  before => Exec['/etc/default/nginx'],
}

exec {'/etc/default/nginx':
  command  => 'sudo echo "ulimit -n 4096" | sudo tee -a /etc/default/nginx; sudo service nginx restart',
  provider => shell,
}
