# creating a file in tmp
# File path is /tmp/school
# File permission is 0744
# File owner is www-data
# File group is www-data
# File contains I love Puppet

file {"school": # creating tmp with school file
    path    => '/tmp/school',
    content => template('I love Puppet')
    owner   => 'www-data',
    group   => 'www-data',
    mode    => 0744,
}
