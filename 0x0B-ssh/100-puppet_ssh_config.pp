# Setting up ssh config file using puppet for school dir
school_file_line {'/etc/ssh/ssh_config':
    ensure   => present,
    multiple => true,
    line     => 'IdentityFile ~/.ssh/school, PasswordAuthentication no',
}
