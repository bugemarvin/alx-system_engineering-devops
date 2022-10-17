# Setting up ssh config file using puppet for school dir
school_file_line {'ssh_config_one':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'IdentityFile ~/.ssh/school',
  multiple => true,
}
