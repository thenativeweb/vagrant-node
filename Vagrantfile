VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.box_check_update = true

  # Ports for Express, http-server and Harp
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  # MongoDB ports
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.network "forwarded_port", guest: 28017, host: 28017

  # RabbitMQ ports
  config.vm.network "forwarded_port", guest: 5672, host: 5672
  config.vm.network "forwarded_port", guest: 15672, host: 15672

  config.ssh.forward_agent = true

  config.vm.synced_folder "../", "/home/vagrant/projects"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provider "vmware_fusion" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provision "docker", version: "1.2" do |docker|
    docker.run "tutum/mongodb", args: "-p 27017:27017 -p 28017:28017 -e MONGODB_PASS=\"admin\""
    docker.run "tutum/rabbitmq", args: "-p 5672:5672 -p 15672:15672 -e RABBITMQ_PASS=\"admin\""
  end

  config.vm.provision "shell", path: "provision.sh", privileged: false
end
