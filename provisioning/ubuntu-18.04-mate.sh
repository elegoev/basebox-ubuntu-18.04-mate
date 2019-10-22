#!/bin/bash

# install apt-add-repository
sudo apt-get update
echo n | sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install xrdp
sudo apt-get install -y xrdp
sudo cp /vagrant/files/apps/xrdp/km-00000807.ini /etc/xrdp/km-00000807.ini
sudo chmod 644 /etc/xrdp/km-00000807.ini

# set session
echo mate-session> /home/vagrant/.xsession
sudo chown vagrant /home/vagrant/.xsession
sudo chgrp vagrant /home/vagrant/.xsession

# restart xrdp
sudo service xrdp restart

# set keyboard input
# sudo loadkeys ch
L='ch' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard

# create date string
DATE=`date +%Y%m%d%H%M`

# set version
UBUNTU_VERSION=$(lsb_release -a | grep Release | awk  '{print $2}')
echo "ubuntu-$UBUNTU_VERSION" > /vagrant/version
