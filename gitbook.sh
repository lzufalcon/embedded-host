#!/bin/bash
#
# Gitbook environment
#

apt-get install -y nodejs npm
apt-get install -y calibre

npm config set registry https://registry.npm.taobao.org
npm install gitbook-cli -g
rm /usr/local/bin/gitbook
sh -c 'echo "nodejs /usr/local/lib/node_modules/gitbook-cli/bin/gitbook.js \$@" > /usr/local/bin/gitbook'
chmod +x /usr/local/bin/gitbook

npm install gitbook-plugin-duoshuo -g
npm install gitbook-plugin-disqus -g
npm install gitbook-plugin-google_code_prettify -g
npm install gitbook-plugin-collapsible-menu -g
npm install gitbook-plugin-maxiang -g
npm install gitbook-plugin-multipart -g

gitbook fetch latest
