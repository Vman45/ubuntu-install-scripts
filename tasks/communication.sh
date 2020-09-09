#!/bin/bash

echo -n "Installation of Slack...   "
sudo apt-get --yes install curl gnupg apt-transport-https > /dev/null 2>&1
curl -fsSL https://packagecloud.io/slacktechnologies/slack/gpgkey | sudo apt-key add - > /dev/null 2>&1
sudo sh -c 'echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" > /etc/apt/sources.list.d/slack.list'  > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install slack-desktop > /dev/null 2>&1
echo "Done"

# Install Skype
echo -n "Installation of Skype...   "
sudo apt-get --yes install apt-transport-https > /dev/null 2>&1
curl -fsSL https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add - > /dev/null 2>&1
sudo sh -c 'echo "deb [arch=amd64] https://repo.skype.com/deb stable main" > /etc/apt/sources.list.d/skype-stable.list'  > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install skypeforlinux > /dev/null 2>&1
echo "Done"

# Install Teams
echo -n "Installation of Teams...   "
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - > /dev/null 2>&1
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'  > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install teams > /dev/null 2>&1
echo "Done"

# Install Signal
echo -n "Installation of Signal...   "
curl -fsSL https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add - > /dev/null 2>&1
sudo add-apt-repository --yes "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" > /dev/null 2>&1
sudo apt update > /dev/null 2>&1
sudo apt-get --yes install signal-desktop > /dev/null 2>&1
echo "Done"

# Zoom installation
zoomdesktop=$(dpkg -s zoom 2>/dev/null | grep Status)
if [[ $zoomdesktop != *"installed"* ]]; 
then
  echo "Zoom is not installed..."
  echo -n "Zoom will be downloaded and installed...   "
  wget https://zoom.us/client/latest/zoom_amd64.deb > /dev/null 2>&1
  sudo apt-get --yes install ./zoom_amd64.deb > /dev/null 2>&1
  rm -f ./zoom_amd64.deb > /dev/null 2>&1
  echo "Done"
else
  echo "Zoom is already installed...   Skip"
fi
