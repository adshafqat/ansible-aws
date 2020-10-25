# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "geerlingguy/centos8"
  config.ssh.insert_key= false
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider:virtualbox do |v|
    v.memory = 3000
    v.linked_clone=true
  end

  #App server 1
  config.vm.define "master" do |master|
    master.vm.hostname = "master.test"
    master.vm.network :private_network, ip: "192.168.60.4"
  end

  #App server 2
  config.vm.define "infra" do |infra|
    infra.vm.hostname = "infra.test"
    infra.vm.network :private_network, ip: "192.168.60.5"
  end

  #DB server 
  config.vm.define "worker" do |worker|
    worker.vm.hostname = "worker.test"
    worker.vm.network :private_network, ip: "192.168.60.6"
  end


end

