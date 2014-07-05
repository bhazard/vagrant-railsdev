# -*- mode: ruby -*-
# vi: set ft=ruby :

DOMAIN = 'billhazard.local'
SUBNET = '192.168.2'
GUEST_IP = "#{SUBNET}.10"

PUPPET_MANIFESTS_PATH = 'puppet/manifests'
PUPPET_MODULE_PATH = ['puppet/site-modules','puppet/base-modules', 'puppet/puppetlabs-modules']
SERVER_MEMORY = 1024

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# Use the Vagrant cachier plugin if it is installed on the host
  config.cache.auto_detect = true if Vagrant.has_plugin?('vagrant-cachier')

  config.vm.box = "ubuntu-trusty-server-64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Disable automatic box update checking. Check via `vagrant box outdated`.
  config.vm.box_check_update = false

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.define "railsdev", primary: true do |vmconfig|
    vmconfig.vm.network :private_network, ip: GUEST_IP
    vmconfig.vm.hostname = "railsdev.#{DOMAIN}"
  # Accessing "localhost:8080" will access port 80 on the guest machine.
    vmconfig.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
    vmconfig.vm.provider :virtualbox do |vb|
      vb.name = vmconfig.vm.hostname
      vb.gui = false # Headless
      vb.customize ["modifyvm", :id, "--memory", SERVER_MEMORY]
    end
#    vmconfig.vm.provision :puppet, :options => ["--pluginsync --hiera_config /vagrant/deploy/hiera.yaml"], :module_path => "deploy/modules", :facter => { "middleware_ip" => "#{SUBNET}.10" } do |puppet|
    vmconfig.vm.provision :puppet, :facter => { "middleware_ip" => GUEST_IP } do |puppet|
      puppet.manifests_path = PUPPET_MANIFESTS_PATH
      puppet.module_path = PUPPET_MODULE_PATH
      puppet.manifest_file  = 'site.pp'
      puppet.hiera_config_path = "puppet/hiera.yaml"
    end
  end

end
