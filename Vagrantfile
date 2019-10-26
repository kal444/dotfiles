$provision = <<SCRIPT
set -e
uname -a
whoami
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 1
    vb.memory = 2048
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
  end

  config.vm.network "forwarded_port", guest:  80, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true

  config.vm.provision "shell", inline: $provision

end
