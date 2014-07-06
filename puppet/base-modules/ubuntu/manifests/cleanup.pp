
class ubuntu::cleanup {
# -------------------------------------------
# remove standard ubuntu goo we do not need
# -------------------------------------------

	package {'chef':
		ensure => 'purged'
	}
	package {'chef-zero':
		ensure => 'purged'
	}
	package {'landscape-client':
		ensure => 'purged'
	}
	package {'landscape-common':
		ensure => 'purged'
	}
	package {'popularity-contest':
		ensure => 'purged'
	}

# Don't need the puppet service running.  we do everything via apply.
	service { "puppet":
	  enable => false,
		ensure => stopped,
	}

# motd will update after reboot
	file {'/etc/update-motd.d/51-cloudguest':
		ensure => 'absent'
  }
	file {'/etc/update-motd.d/10-help-text':
		ensure => 'absent'
  }
	file {'/etc/update-motd.d/98-cloudguest':
		ensure => 'absent'
  }

}