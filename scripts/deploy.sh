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

# install jdk path varialbles

echo 'export JAVA_HOME="/usr/lib/java/jdk1.8"' >> .bashrc
echo 'PATH=:$PATH:$JAVA_HOME/bin' >> .bashrc

# install postgresql
sudo apt-get --force-yes -y install postgresql

# start postgresql server
sudo service postgresql start

# configure postgresql server

sudo sh -c "echo 'host     all    all    0.0.0.0/0    trust' >> /etc/postgresql/9.4/main/pg_hba.conf"

# insta wildfly
wget http://download.jboss.org/wildfly/10.0.0.Final/wildfly-10.0.0.Final.tar.gz

tar -xf wildfly-10.0.0.Final.tar.gz

rm wildfly-10.0.0.Final.tar.gz

sudo mv wildfly-10.0.0.Final /opt/wildfly-10.0.0.Final

sudo chown -R vagrant:vagrant /opt/wildfly-10.0.0.Final

rm /opt/wildfly-10.0.0.Final/standalone/configuration/standalone.xml

mv deploy/standalone.xml /opt/wildfly-10.0.0.Final/standalone/configuration

mv deploy/org /opt/wildfly-10.0.0.Final/modules

sudo mv deploy/wildfly /etc/init.d

sudo mv deploy/wildfly_conf/wildfly /etc/default

sudo chmod +x /etc/init.d/wildfly

sudo update-rc.d wildfly defaults

# configure postgresql.conf
sudo sed -i "s/listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.4/main/postgresql.conf

# open port 5432
sudo iptables -A INPUT -p tcp --dport 5432 -j ACCEPT

sudo service postgresql restart