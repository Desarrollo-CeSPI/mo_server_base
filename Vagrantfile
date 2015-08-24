# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  
  config.vm.hostname = "mo-server-base-berkshelf"

  config.omnibus.chef_version = "11.16.4"

  #config.vm.box = "chef/ubuntu-14.04"
  config.vm.box = "chef/debian-7.7"

  config.vm.network :private_network, type: "dhcp"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = 'sample/data_bags'
    chef.json = {
    }

    chef.run_list = [
      "recipe[chef-solo-search]", # Only needed when using Chef-Solo for the users creation
      "recipe[mo_server_base::default]"
    ]
  end
end
