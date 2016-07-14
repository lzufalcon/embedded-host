#!/bin/bash
#
# docker.sh -- install docker-engine
#

which docker
if [ $? -eq 1 ]; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    version=`sed -n -e "/ main/p" /etc/apt/sources.list | grep -v ^# | head -1 | cut -d' ' -f3`
    sudo bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-'${version}' main" > /etc/apt/sources.list.d/docker.list'
    sudo apt-get -y update
    sudo apt-get -y install docker-engine
    sudo usermod -aG docker $USER

    echo "Note: To let docker work without sudo, please restart the X session."


    sudo sed -i -e "/ALIYUN REGISTRY START 578327498237/,/ALIYUN REGISTRY END 789527394722/d" /etc/default/docker
    sudo bash -c 'cat <<EOF >> /etc/default/docker
# ALIYUN REGISTRY START 578327498237
DOCKER_OPTS="\$DOCKER_OPTS --insecure-registry=registry.mirrors.aliyuncs.com"
# ALIYUN REGISTRY END 789527394722
EOF'

    sudo pkill docker
    # sudo pkill X
fi
