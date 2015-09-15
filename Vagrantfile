# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box       = "ubuntu/trusty64"
  config.vm.box_url   = 'http://files.vagrantup.com/precise32.box'
  config.vm.host_name = 'chef-rails-dev-box'
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.share_folder("vagrant-root", "/vagrant", ".", "nfs" => true)
end
