# Setting up ssh config file using puppet for school dir
file_line {'/etc/ssh/ssh_config':
    ensure   => present,
    multiple => true,
    line     => 'IdentityFile ~/.ssh/school',\
}
file_line {'etc/ssh/ssh_config':
    ensure  => present,
    multiple => true,
    line     => 'PasswordAuthentication no',
}
