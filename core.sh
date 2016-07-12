#!/bin/bash
#
# core.sh -- install a full embedded Linux development envrionment for Ubuntu
#

TOP_DIR=$(dirname `readlink -f $0`)
version=`cat /etc/issue | tr '[:upper:]' '[:lower:]' | cut -d ' ' -f1,2 | cut -d'.' -f1,2 | tr ' ' '-'`

## Basic
sudo apt-get update
cat ${TOP_DIR}/tools/${version}.txt \
	| egrep -v '^#|^$' |  tr -s '\n' | tr -s ' ' \
	| xargs -i echo sudo apt-get install -y {} | tr '\n' ';' | bash
