# Setting up ssh config file using puppet for school dir
file_line {'ssh_config_one_work':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'IdentityFile ~/.ssh/school',
  multiple => true,
}
file_line {'ssh_config_two_work':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'PasswordAuthentication no',
  multiple => true,
}
