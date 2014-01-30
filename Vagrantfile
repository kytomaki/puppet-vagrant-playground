# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision :shell, :inline => "puppet --version | grep -q 3.4 || ( wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb && sudo dpkg -i puppetlabs-release-precise.deb && sudo apt-get update -qq && sudo apt-get install -qq puppet ruby-deep-merge)"

  # ALTER HERE!!
  config.vm.hostname = "default.local"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "358"]
  end

  config.vm.synced_folder("puppet", "/tmp/vagrant-puppet/puppet")
  config.vm.synced_folder("puppet/hiera", "/etc/puppet/hiera")

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "site.pp"
    #puppet.options = '--hiera_config=/tmp/vagrant-puppet/puppet/hiera.yaml'
    puppet.options = '--debug --verbose --hiera_config=/tmp/vagrant-puppet/puppet/hiera.yaml'
  end

end
