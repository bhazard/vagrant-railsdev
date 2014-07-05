vagrant-railsdev
================

Minimal vagrant and puppet setup to create an ubuntu rails development environment.

This project exists to allow me to setup a standard virtual ubuntu rails dev
environment.  Some folks use a base image for this purpose and just edit the
details as needed, but I wanted to be able to declaratively customize and share
the resulting environments.

This project uses the [puppetlabs RVM module](https://forge.puppetlabs.com/maestrodev/rvm)

# Requirements

- vagrant version 2 or later
- virtualbox

# The Resulting Environment

The puppet files create a virutal rails development environment from a base 
ubuntu image.  The target environment is as follows:

- git
- puppet (masterless)
- RVM
- rails 4 (configurable via hiera)
- ruby 2 (configurable via hiera)

