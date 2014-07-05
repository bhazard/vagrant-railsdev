
class ubuntu::standard {

# Add standard stuff
	file {'/etc/profile.d/setterm.sh':
		content => 'export TERM=xterm-color'
	}

# When vagrant invokes puppet via vagrant provision, the standard .profile
# for root under ubuntu complains -- "stdin: is not a tty" due to a bug in
# the default .profile for root.   
	file { '/root/.profile':
		content => template('ubuntu/root.profile.erb')
  }

	file { "/etc/localtime":
		ensure => 'link',
		target => '/usr/share/zoneinfo/US/Eastern'
	}

}