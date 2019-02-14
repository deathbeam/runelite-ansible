# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box.
  config.vm.box = "centos/7"

  # Create a forwarded port mapping for API
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
