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
yum install nginx
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
echo " AREPAS4G0 SETUP HAS BEEN COMPLETED"
echo "---------------------------------------------------------------"
