# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "k8s-m" do |cfg|
    cfg.vm.box = "ubuntu/focal64"
    cfg.vm.provider "virtualbox" do |vb|
      vb.name = "k8s-m"
      vb.cpus = 2
      vb.memory = 2048
      vb.customize ["modifyvm", :id, "--groups", "/k8s"]
    end

    cfg.vm.host_name = "k8s-m"
    cfg.vm.network "private_network", ip: "192.168.56.4"
    cfg.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: true, id: "ssh"
    cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    cfg.vm.provision "file", source: "ping_2_nds.sh", destination: "ping_2_nds.sh" 
    cfg.vm.provision "shell", path: "config.sh"
  end

  (1..2).each do |i|
    config.vm.define "k8s-w#{i}" do |cfg|
      cfg.vm.box = "ubuntu/focal64"
      cfg.vm.provider "virtualbox" do |vb|
        vb.name = "k8s-w#{i}"
        vb.cpus = 1
        vb.memory = 1024
        vb.customize ["modifyvm", :id, "--groups", "/k8s"]
      end
      cfg.vm.host_name = "k8s-w#{i}"
      cfg.vm.network "private_network", ip: "192.168.56.10#{i}"
      cfg.vm.network "forwarded_port", guest: 22, host: "6010#{i}", auto_correct: true, id: "ssh"
      cfg.vm.synced_folder "../data", "/vagrant", disabled: true
    end
  end
end
