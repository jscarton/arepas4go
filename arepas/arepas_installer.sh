#!/usr/bin/env bash

echo "---------------------------------------------------------------"
echo " "
echo " "
echo "      AREPAS4GO INSTALLER v20171015"
echo " "
echo " "
echo "---------------------------------------------------------------"
yum -y install epel-release
yum update
yum -y install nano wget


echo "---------------------------------------------------------------"
echo "INSTALLING GIT"
echo "---------------------------------------------------------------"
yum -y install git

echo "---------------------------------------------------------------"
echo "INSTALLING NGINX"
echo "---------------------------------------------------------------"
yum install -y nginx
systemctl start nginx
systemctl enable nginx

echo "---------------------------------------------------------------"
echo "INSTALLING GO 1.9.1"
echo "---------------------------------------------------------------"
wget -O go1.9.1.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
tar -xvf go1.9.1.linux-amd64.tar.gz
mv go /opt/go
echo "export GOROOT=/opt/go">>/home/vagrant/.bash_profile
echo "export PATH=\$PATH:\$GOROOT/bin">>/home/vagrant/.bash_profile
echo "export GOPATH=/home/vagrant/workspace">>/home/vagrant/.bash_profile
echo "export PATH=\$PATH:\$GOPATH/bin">>/home/vagrant/.bash_profile

echo "---------------------------------------------------------------"
echo "INSTALLING MongoDB 3.4"
echo "---------------------------------------------------------------"
echo "[mongodb-org-3.4]">/etc/yum.repos.d/mongodb-org-3.4.repo
echo "name=MongoDB Repository">>/etc/yum.repos.d/mongodb-org-3.4.repo
echo "baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/">>/etc/yum.repos.d/mongodb-org-3.4.repo
echo "gpgcheck=1">>/etc/yum.repos.d/mongodb-org-3.4.repo
echo "enabled=1">>/etc/yum.repos.d/mongodb-org-3.4.repo
echo "gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc">>/etc/yum.repos.d/mongodb-org-3.4.repo
yum install -y mongodb-org
service mongod start
chkconfig mongod on

echo "---------------------------------------------------------------"
echo " AREPAS4G0 SETUP HAS BEEN COMPLETED"
echo "---------------------------------------------------------------"
