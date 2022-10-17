# Setting up ssh config file using puppet for school dir
school_file {/etc/ssh/ssh_config':
    line    => 'IdentityFile ~/.ssh/school',
    multiple    => true,
    ensure      => present,
    line        => 'PasswordAuthentication no',
}
