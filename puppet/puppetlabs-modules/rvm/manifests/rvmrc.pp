# Configure the /etc/rvmrc file
class rvm::rvmrc(
  $template = 'rvm/rvmrc.erb',
  $umask = 'u=rwx,g=rwx,o=rx',
  $max_time_flag = '40',
  $autoupdate_flag = '0') inherits rvm::params {

  include rvm::group

  file { '/etc/rvmrc':
    content => template($template),
    mode    => '0664',
    owner   => 'root',
    group   => $rvm::params::group,
    before  => Exec['system-rvm'],
  }
}
