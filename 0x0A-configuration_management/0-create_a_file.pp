# creating a file in tmp
# File path is /tmp/school
# File permission is 0744
# File owner is www-data
# File group is www-data
# File contains I love Puppet

file {'school': # creating school file
    ensure  => 'present',
    mode    => '0744',
    path    => '/tmp/school',
    owner   => 'www-data',
    group   => 'www-data',
    content => 'I love Puppet',
}
