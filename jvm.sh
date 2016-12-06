#!/bin/bash
#
# Oracle JDK/JRE
#

version=6

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get install -y --force-yes oracle-java${version}-installer

sed -i -e "/ORACLE JAVA START 7582374572/,/ORACLE JAVA END 3242352345/d" ~/.bashrc
cat <<EOF
# ORACLE JAVA START 7582374572
export JAVA_HOME=/usr/lib/jvm/java-6-oracle/
export PATH=\$JAVA_HOME/bin:\$PATH
export CLASSPATH=\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar
# ORACLE JAVA END 3242352345
EOF
