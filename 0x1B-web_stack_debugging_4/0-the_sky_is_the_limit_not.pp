# fixing nginx to handle extra request for open file

exec {'update':
  provider => shell,
  command  => 'apt-get -y update',
  before   => Exec['nginx'],
}

exec {'nginx':
  provider => shell,
  command  => 'apt-get -y install nginx',
  before   => Service['nginx'],
}

service {'nginx':
  ensure => running,
  enable => true,
  before => Exec['/etc/default/nginx'],
}

exec {'/etc/default/nginx':
  command  => 'echo "ULIMIT=\"-n 4096\"" | tee -a /etc/default/nginx;',
  provider => shell,
  before   => Exec['nginx_restart'],
}

exec {'nginx_restart':
  command  => 'service nginx restart',
  provider => shell,
}
