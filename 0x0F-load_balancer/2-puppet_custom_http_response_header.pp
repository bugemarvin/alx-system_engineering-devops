# install nginx and served by
exce { 'update':
  ensure   => present,
  provider => 'shell',
  before   => Exec['nginx'],
  command  => 'sudo apt -y update',
}

exce {'nginx':
  ensure   => present,
  provider => 'shell',
  command  => 'sudo apt -y install nginx',
  before   => Exec['Config_header'],
}

file_line {'Config_header':
  ensure  => present,
  path    => 'etc/nginx/sites-available/default',
  listen  => 'add_header X-Served-By $Hostname;',
  requier => Package['nginx'],
}

service {'nginx':
  ensure  => running,
  requier => Package['nginx'],
}
