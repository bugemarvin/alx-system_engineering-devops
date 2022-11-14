# install nginx and served by

exec { 'update':
  provider => 'shell',
  before   => Exec['nginx'],
  command  => 'sudo apt -y update',
}

exec {'nginx':
  provider => 'shell',
  command  => 'sudo apt -y install nginx',
  before   => Exec['config'],
}

exec {'config':
  command  => 'sudo sed -i s@"http {"@"http {\n\tadd_header X-Served-By \$HOSTNAME;"@g /etc/nginx/nginx.conf',
  provider => 'shell',
  before   => Exec['restart'],
}

exec {'restart':
  provider => 'shell',
  command  => 'sudo service nginx restart',
}
