# This module installs ruby and rails via rvm.  The module uses a modified
# version of the puppetlabs RVM module, available here:
# https://forge.puppetlabs.com/maestrodev/rvm
# from nice article here:
# http://phaseshiftllc.com/articles/2012/03/19/setting-up-vagrant-with-rvm-and-mysql-for-rails-development.html
class rubyonrails {
  # class requirements {
  #   group { "puppet": ensure => "present", }
  #   exec { "apt-update":
  #     command => "/usr/bin/apt-get -y update"
  #   }

  #   package {
  #     ["mysql-client", "mysql-server", "libmysqlclient-dev"]:
  #       ensure => installed, require => Exec['apt-update']
  #   }
  # }

  class { 'rvm':
  }

# Ensure that user vagrant (default vagrant box user) is in the rvmsudoers group
  rvm::system_user { vagrant: ; }

# Update as needed.  Note that as of this writing (July 2014), RVM does not
# appear to find binaries unless the version is fully qualified.  If you wish
# to specify a more fuzzy version (e.g., ruby-2.0.0 or ruby 2.1), you will need
# to remove the build_opts line requiring --binary or the install will fail.
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


}