# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box.
  config.vm.box = "centos/7"

  # Create a forwarded port mapping for API
  config.vm.network "forwarded_port", guest: 9080, host: 9080 # tomcat
  config.vm.network "forwarded_port", guest: 8081, host: 8081 # websocket service
  config.vm.network "forwarded_port", guest: 3306, host: 3306 # database
  config.vm.network "forwarded_port", guest: 6379, host: 6379 # redis
  config.vm.network "forwarded_port", guest: 9000, host: 9000 # minio

  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
