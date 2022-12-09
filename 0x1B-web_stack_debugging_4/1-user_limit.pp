# fix for too many files.

exec {'hard':
  command  => "sed -i s/'holberton hard nofile 5'/'holberton hard nofile 4096'/g /etc/security/limits.conf",
  path     => '/bin',
  provider => shell,
  before   => Exec['soft']
}

exec {'soft':
  command  => "sed -i s/'holberton soft nofile 4'/'holberton soft nofile 4096'/g /etc/security/limits.conf",
  path     => '/bin',
  provider => shell,
}
