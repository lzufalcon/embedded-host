#!/bin/bash
#
# flash-player.sh -- install pepperflashplugin-nonfree
#

sudo apt-get install -y pepperflashplugin-nonfree
gpg --keyserver pgp.mit.edu --recv-keys 1397BC53640DB551
gpg --export --armor 1397BC53640DB551 | sudo sh -c 'cat >> /usr/lib/pepperflashplugin-nonfree/pubkey-google.txt'
sudo /usr/sbin/update-pepperflashplugin-nonfree --install
sudo /usr/sbin/update-pepperflashplugin-nonfree --status
