# Setting up ssh config file using puppet for school dir
file_line {'ssh_config_one':
    ensure   => present,
    multiple => true,
    line     => 'IdentityFile ~/.ssh/school',
    path     => '/etc/ssh/ssh_config',
}
file_line {"ssh_config_two":
    ensure      =>  present,
    multiple    =>  true,
    line        =>  'PasswordAuthentication no',
    path        =>  '/etc/ssh/ssh_config',
}
