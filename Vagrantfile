Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "install.sh"
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box_download_checksum_type = "sha256"
  config.vm.box_download_checksum = "83def10ea740b337f8a7cc647963d406c765cda0d25f57cdb4eaeda773fd1aca"
end
