# install nginx server
# must be served at port 80

package { 'nginx':
    ensure      => installed,
    port => 80,
}
