# ubuntu-server

1. install virtual box - https://www.virtualbox.org/wiki/Downloads 
2. install vagrant - https://www.vagrantup.com/downloads.html
3. install winscp - https://winscp.net/eng/download.php
4. install putty - http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
5. download repository ubuntu-server - https://github.com/KonstantinAMP/ubuntu-server.git
6. run 'vagrant up' in root direcoty - install debian on virtual box
7. connect to vm on ssh (port:2222, host:localhost, user:vagrant, password:vagrant)
8. copy deploy.sh and deploy folder in /home/vagrant
9. run command:
  chmod +x deploy.sh
  ./deploy.sh
10. create new wildfly user
  cd /opt/wildfly-10.0.0.Final/bin
  ./add-user.sh
  responce yes
11. create data base
  sudo su - postgres
  psql -h 127.0.0.1 -p 5432 -U postgres -f "/home/vagrant/deploy/init.sql"

postgres - database: testdb, user: test_user, password: qwerty;
Wildfly - console: localhost:4804, http: 4800
