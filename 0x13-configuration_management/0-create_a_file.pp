# Create a file called alx in the /tmp directory
file { '/tmp/alx':
  ensure  => file,
  path    => '/tmp/alx',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet'
}
