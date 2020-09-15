#!/bin/bash

# Update the whole system
echo -n "This computer will be updated now...   "
sudo apt-get update > /dev/null 2>&1 && sudo apt-get --yes dist-upgrade > /dev/null 2>&1
echo "Done"

# Add HWE
echo -n "Installation of Ubuntu HWE for LTS...   "
sudo apt-get --yes install --install-recommends linux-generic-hwe-20.04 > /dev/null 2>&1
echo "Done"

# Install useful system applications
echo -n "Installation of system tools...   "
sudo apt-get --yes install \
htop iftop iptraf-ng dnsutils powertop partitionmanager mc tmux \
yakuake vim openssh-server muon ksysguard ksystemlog > /dev/null 2>&1
echo "Done"

# Install network applications
echo -n "Installation of VPN related tools...   "
sudo apt-get --yes install \
network-manager-vpnc network-manager-strongswan \
network-manager-ssh network-manager-pptp network-manager-openvpn \
network-manager-openconnect network-manager-iodine network-manager-l2tp \
network-manager-fortisslvpn  wireguard > /dev/null 2>&1
echo "Done"

# Install KeePassXC - offcial repository
echo -n "Installation of KeePassXC...   "
sudo add-apt-repository --yes ppa:phoerious/keepassxc > /dev/null
sudo apt-get update > /dev/null
sudo apt-get --yes install keepassxc > /dev/null 2>&1
echo "Done"

# Power managment tools for laptops or notebooks
# Chassis type numbers can be found here: 
# https://docs.microsoft.com/en-us/previous-versions/tn-archive/ee156537(v=technet.10)
chassis=$(cat /sys/class/dmi/id/chassis_type)
if [[ $chassis == 8 ]] || [[ $chassis == 9 ]] || [[ $chassis == 10 ]] || [[ $chassis == 14 ]]; 
then
  echo "This device is a mobile computer with a battery..."
  echo -n "Installing power management tools...   "
  sudo apt-get --yes install tlp tlp-rdw acpi-call-dkms > /dev/null 2>&1
  # Configuration file for tlp: /etc/default/tlp
  echo "Done"
else
  echo "This device does not have a battery. No power managment tools required...   Skip"
fi

# Check if Nvidia GPU is available and install the default driver 
# from Ubuntu. After installation choose Intel GPU.
gpucontroller=$(lspci -v | grep '3D controller')
if [[ $gpucontroller == *"NVIDIA"* ]]; 
then
  echo "Nvidia GPU found..."
  echo "Installing Nvidia driver now...   "
  sudo apt-get --yes install nvidia-driver-440 nvidia-utils-440 > /dev/null 2>&1
  sudo prime-select intel > /dev/null 2>&1
  echo "Done"
else
  echo "This device does not require a specific GPU driver...   Skip"
fi
