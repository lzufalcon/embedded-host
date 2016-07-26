#!/bin/bash
#
# Install mips toolchain from emdebian.org
#

sudo bash -c 'echo deb http://www.emdebian.org/debian/ wheezy main > /etc/apt/sources.list.d/emdebian.list'
sudo apt-get install -y emdebian-archive-keyring
sudo apt-get -y update
# pushd misc
# wget -c http://archive.ubuntu.com/ubuntu/pool/universe/g/gmp4/libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb
# popd
sudo dpkg -i misc/libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb
sudo apt-get -y --force-yes install gcc-4.3-mipsel-linux-gnu
