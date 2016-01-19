Up and Running
==============

Throughout the course we will use various computer-based tools to as an aid to solving problems.  Most of the tools are written in some combination of Fortran, C++, and Python, with numerous support libraries.  Trying to get everyone up and running with a system that works on various operating systems is a headache I want to avoid.  Therefore, I have packaged all the computational tools that will be needed in this course into a virual environment.  Once it is setup on your computer, most of your interaction with the virtual environment will be through a simple web application.

Installation of this virtual environment should be straight-forward, but expect to spend an hour or two to get everything downloaded and installed initially.  Once everything is installed, you will probably need another hour or so to play around and make sure you can operate successfully in this environment.

Prerequisites
-------------

Two pieces of third-party software are required to administer the virtual machine (VM).  Both are free and do not require a sign-up.

- Download and install VirtualBox from `here <https://www.virtualbox.org/>`_.
- Download and install Vagrant from `here <https://www.vagrantup.com/>`_.

Setup
-----

Now that the machinery is in place, you need to create and configure the VM.  I have made this easy: all you need to do is download a configuration file and then run a single command from a command prompt/terminal.

You do need to decide where you want to access your VM from.  You should create a new folder/directory for this.  This new folder should be easily accessible, e.g., in your "Documents" folder, your home/user folder, etc.  For me, this is a folder named ``uml_engy_5050`` in my home directory.  I will call this the "VM folder."

- Download the Vagrantfile to the VM folder that you just created.
- From a command prompt/terminal, navigate to the VM folder (using the ``cd`` command) and enter the command ``vagrant up``.

The first time you run the ``vagrant up`` command, the base VM will be downloaded from the internet, provisioned, then started in the background.  This process will likely take a long time, so plan accordingly!  Once your VM is installed and provisioned the first time it will be much quicker to load it in the future.

Using the System
----------------

If you just installed the VM following the instructions in the previous example, your VM is already up and running.  If your VM is not currently running because you shut it down or rebooted your computer, just run ``vagrant up`` from a command prompt in your VM folder.

Next, open a web browser and enter ``127`` in the address bar.

Save/locate files

Shutting Down
-------------
  
- Shutdown jupyter

To shutdown your VM issue the command ``vagrant halt`` from a command prompt in your VM folder.  This will stop the VM and free up all of the resources that the VM was using.

Uninstalling
------------
  
If you want to completely eradicate the VM and all memory of it from your computer, run the command ``vagrant destroy`` from the VM folder.  If you decide you want it back, you can run ``vagrant up`` again, and this will start the installation and provisioning process from scratch.

VirtualBox and Vagrant ship with their own uninstallers.
