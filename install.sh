#!/bin/bash

# exit immediately if something fails
set -e

# freshen up aptitude
sudo apt-get update -y -qq > /dev/null
sudo apt-get upgrade -y -qq > /dev/null

# install stuff to help install stuff
sudo apt-get -y -q install git unzip

# configure passwordless sudo
usermod -a -G admin vagrant
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# fail asap if sed blew it
sudo date

# install virtualbox
sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list"
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get -y -q install virtualbox-4.3 dkms

# download the packer binary
wget -q -O ~/packer.zip https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip

# unzip to the 'packer' directory in homedir and cleanup .zip
unzip ~/packer.zip -d /home/vagrant/packer
rm ~/packer.zip

# run the command to verify installation
/home/vagrant/packer/packer version
