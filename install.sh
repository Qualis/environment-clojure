#!/bin/sh

file_exists() {
  echo "file_exists: "$1
   if [ -f "$1" ]; then
     return 0;
   else
     return 1;
   fi
}

# check for dependencies
echo 'Install Vagrant';
if ( ! file_exists "./Vagrant.pkg" || ! file_exists "./VirtualBox.pkg" || ! file_exists "./precise64.box" ); then
  echo "Vagrant.pkg, VirtualBox.pkg and precise64.box are dependencies";
  exit;
fi;

# install Vagrant
sudo installer -pkg Vagrant.pkg -target /

# install VirtualBox
echo 'Install VirtualBox';
sudo installer -pkg VirtualBox.pkg -target /

# install ansible
sudo easy_install pip
sudo pip install ansible --quiet

# install vagrant precise64 box
vagrant box add precise64 precise64.box
