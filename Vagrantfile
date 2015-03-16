# -*- mode: ruby -*-
# vi: set ft=ruby :
#

Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.define "serverspec2-playground", primary: true do |s|
    s.vm.synced_folder "spec.d/", "/mnt/spec.d"

    # install & run serverspec
    s.vm.provision 'shell', inline: <<EOS
    	export DEBIAN_FRONTEND=noninteractive
	sudo apt-get update -yqq
	sudo apt-get -yqq install git
EOS

    s.vm.provision 'shell', privileged: false, inline: <<EOS
	sudo gem install rake serverspec
EOS

    s.vm.provision 'shell', privileged: false, inline: <<EOS
	sudo su - -c "cd /root && git clone https://github.com/de-wiring/ix.git"
EOS

#    s.vm.provision 'shell', inline: <<EOS
#[ -e /usr/lib/apt/methods/https ] || {
#  apt-get update
#  apt-get install apt-transport-https
#}
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
#sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
#sudo apt-get -yqq install lxc-docker
#sudo usermod -G docker vagrant
#EOS
#
#    # create some sample playground, so that demo steps will run
#    s.vm.provision 'shell', inline: <<EOS
#docker pull busybox:latest
#docker run -tdi --name "c1" busybox
#docker run -tdi --name "c2" -v /data:/tmp busybox
#EOS

  end
  
end
