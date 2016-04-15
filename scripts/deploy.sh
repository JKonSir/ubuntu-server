#!/bin/bash

# upgrade aptitude repository
sudo apt-get update

# install midnight commander
sudo apt-get --force-yes -y install mc

# install jdk
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz

tar -xf jdk-8u77-linux-x64.tar.gz

sudo mkdir -p /usr/lib/java

sudo mv jdk1.8.0_77 /usr/lib/java/jdk1.8

rm jdk-8u77-linux-x64.tar.gz

echo 'export JAVA_HOME="/usr/lib/java/jdk1.8"' >> .bashrc
echo 'PATH=:$PATH:$JAVA_HOME/bin' >> .bashrc

# install postgresql
sudo apt-get --force-yes -y install postgresql

# start postgresql server
sudo service postgresql start

# insta wildfly
wget http://download.jboss.org/wildfly/10.0.0.Final/wildfly-10.0.0.Final.tar.gz

tar -xf wildfly-10.0.0.Final.tar.gz

rm wildfly-10.0.0.Final.tar.gz

sudo mv wildfly-10.0.0.Final /server



