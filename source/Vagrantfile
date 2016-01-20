# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 8888, host: 8888

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  #

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
config.vm.provision "shell", privileged: false, inline: <<-SHELL
    bash /vagrant/pyne_install_ubuntu14.sh 
    source .bashrc 
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python get-pip.py 
    sudo pip install jupyter
    mkdir /vagrant/notebooks
    sudo apt-get install -y swig
    git clone https://github.com/mit-crpg/PINSPEC.git PINSPEC
    cd PINSPEC/
    python setup.py install --user
    python setup.py install --user
  SHELL

  config.vm.provision "shell", run: "always", privileged: false, inline: <<-SHELL
    ipython notebook --notebook-dir=/vagrant/notebooks --no-browser --ip=0.0.0.0 &
  SHELL
end
