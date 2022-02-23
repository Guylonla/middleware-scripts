#!/bin/bash

#Description: Installing Sonarqube packages
#Author: Group 5, Isaiah
#Date: Feb 22 2022

echo "Let's install Sonarqube Packages"
sleep 2

echo "Java 11 installation.."
echo
yum update -y
yum install java-11-openjdk-devel -y
yum install java-11-openjdk -y
echo
echo "Downloading SonarQube lastest versions on the server"
echo
cd /opt
yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
echo
echo "Extracting packages.."
echo
yum install unzip -y
unzip /opt/sonarqube-9.3.0.51899.zip
echo
echo "Changing ownership and switching linux binaries directory to start service"
echo
chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
echo
echo "Checking firewall and reloading"
echo
firewall-cmd --permanent --add-port=9000/tcp
firewall-cmd --reload

echo "Installation was successful"
