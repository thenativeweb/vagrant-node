VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.3"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_check_update = true

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.synced_folder "../", "/home/vagrant/thenativeweb"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provider "vmware_fusion" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provision "shell", path: "provision.sh", privileged: false

  config.vm.provision "docker" do |docker|
    # docker.run "rabbitmq"
  end
end
