# site.pp
# puppet configuration file
# -------------------------------------------------

include ubuntu::cleanup
include ubuntu::standard

package { "git":
	ensure => installed,
}

# from nice article here: http://phaseshiftllc.com/articles/2012/03/19/setting-up-vagrant-with-rvm-and-mysql-for-rails-development.html
# stage { 'req-install': before => Stage['rvm-install'] }

class requirements {
  group { "puppet": ensure => "present", }
  exec { "apt-update":
    command => "/usr/bin/apt-get -y update"
  }

  package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev"]: 
      ensure => installed, require => Exec['apt-update']
  }
}

class { 'rvm':
#  rvmrc::max_time_flag => 40
}

#classinstallrvm {
  #include rvm
  rvm::system_user { vagrant: ; }
  

#  if $rvm_installed == "true" {
		rvm_system_ruby {
  		'ruby-1.9.3-p547':
    		ensure      => 'present',
    		default_use => true,
    		build_opts  => ['--binary'];
  		'ruby-2.0.0-p481':
    		ensure      => 'present',
    		build_opts  => ['--binary'],
    		default_use => false;
		}
#	}
#}

#class doinstall {
#  class { requirements:, stage => "req-install" }
#  include installrvm
#}

#include doinstall