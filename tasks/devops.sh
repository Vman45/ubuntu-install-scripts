#!/bin/bash

# Install Vagrant and Terraform
echo -n "Installing Terraform and Vagrant...   "
sudo apt-get --yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common > /dev/null 2>&1
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - > /dev/null 2>&1
sudo apt-add-repository --yes "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install terraform vagrant > /dev/null 2>&1
echo "Done"

# Ansible
echo -n "Installing Ansible...   "
sudo apt-get --yes install ansible > /dev/null 2>&1
# For future reference if version in Ubuntu 20.04 will be outdated.
#sudo apt-get --yes install software-properties-common
#sudo apt-add-repository --yes --update ppa:ansible/ansible
#sudo apt-get --yes install ansible python-netaddr
echo "Done"

# Docker
echo -n "Installing Docker Engine - Community...   "
sudo apt-get --yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common > /dev/null 2>&1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1
sudo add-apt-repository --yes "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install docker-ce docker-ce-cli containerd.io > /dev/null 2>&1
echo "Done"

# VirtualBox
echo -n "Installing VirtualBox - Community...   "
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common > /dev/null 2>&1
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add - > /dev/null 2>&1
sudo add-apt-repository --yes "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install virtualbox-6.1 > /dev/null 2>&1
echo "Done"

# Minikube

# Helm
