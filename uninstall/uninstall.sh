#!/bin/sh

# uninstall VirtualBox
sudo sh ./VirtualBox_Uninstall.tool

# uninstall Vagrant
vagrant box remove precise64
sudo sh ./Vagrant_Uninstall.tool

# uninstall ansible
sudo pip uninstall ansible -y

# uninstall pip
sudo pip uninstall pip -y
