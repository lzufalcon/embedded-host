#!/bin/bash
#
# docker.sh -- install docker-engine
#

which docker 2>&1 >/dev/null && echo "docker has been installed." && exit 0

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
version=`sed -n -e "/ main/p" /etc/apt/sources.list | grep -v ^# | head -1 | cut -d' ' -f3`
sudo bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-'${version}' main" > /etc/apt/sources.list.d/docker.list'
sudo apt-get -y update
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-get -y install bridge-utils
sudo apt-get -y --force-yes install docker-engine
sudo usermod -aG docker $USER

# The --bip works like https://gist.github.com/ismell/6689836
sudo sed -i -e "/DOCKER HACK START 578327498237/,/DOCKER HACK END 789527394722/d" /etc/default/docker
sudo bash -c 'cat <<EOF >> /etc/default/docker
# DOCKER HACK START 578327498237
# DOCKER_OPTS="\$DOCKER_OPTS --registry-mirror=https://docker.mirrors.ustc.edu.cn"
# DOCKER_OPTS="\$DOCKER_OPTS --dns 119.29.29.29 --dns 180.76.76.76"
# DOCKER_OPTS="\$DOCKER_OPTS --dns 223.5.5.5 --dns 114.114.114.114"
DOCKER_OPTS="\$DOCKER_OPTS --dns 8.8.8.8 --dns 8.8.4.4"
DOCKER_OPTS="\$DOCKER_OPTS --bip=10.66.33.10/24"
DOCKER_OPTS="\$DOCKER_OPTS --storage-opt dm.basesize=5G"
# DOCKER HACK END 789527394722
EOF'
# Restart to make sure the above opts work
sudo ifconfig docker0 down
sudo brctl delbr docker0
sudo service docker restart
