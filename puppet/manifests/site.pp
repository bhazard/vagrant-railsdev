# site.pp
# puppet configuration file
# -------------------------------------------------

include ubuntu::cleanup
include ubuntu::standard

package { 'git':
  ensure => installed,
}

include rubyonrails


