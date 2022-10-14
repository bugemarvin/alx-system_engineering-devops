# create a manifest that kills a process named killmenow
# Must use the exec Puppet resource
# Must use pkill

exec {'/usr/bin/pkill':
    command => '/bin/pkill -f killmenow'
}
