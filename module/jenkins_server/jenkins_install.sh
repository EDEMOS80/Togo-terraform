#!/bin/bash
exec > >(tee /var/log/jenkins-install.log | logger -t user-data -s 2>/dev/console) 2>&1

sudo apt update -y
sudo apt install -y fontconfig openjdk-17-jre

sudo update-alternatives --set editor /usr/bin/vim.basic
sudo update-alternatives --set vi /usr/bin/vim.basic

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install -y jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins

sleep 30

INSTANCE_PUBLIC_IP=$(curl -s ifconfig.me)
ADMIN_KEY=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
JENKINS_URL="http://$INSTANCE_PUBLIC_IP:8080"

echo "Jenkins is installed and running. Access it at: $JENKINS_URL"
echo "Initial Admin Password: $ADMIN_KEY"
