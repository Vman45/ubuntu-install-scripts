#!/bin/bash

# Install basic productivity applications
echo -n "Installation of productivity applications...   "
sudo apt-get --yes install \
firefox thunderbird xul-ext-lightning krdc nautilus-dropbox > /dev/null 2>&1
echo "Done"

# Install LibreOffice
echo -n "Installation of LibreOffice...   "
sudo apt-get --yes install \
libreoffice libreoffice-style-breeze > /dev/null 2>&1
echo "Done"

# Install LaTeX
echo -n "Installation of LaTeX...   "
sudo apt-get --yes install \
texstudio texstudio-doc texlive-full > /dev/null 2>&1
echo "Done"

# JabRef installation
jabref=$(dpkg -s jabref 2>/dev/null | grep Status)
if [[ $jabref != *"installed"* ]]; 
then
  echo "JabRef is not installed..."
  echo -n "JabRef will be downloaded and installed...   "
  wget https://github.com/JabRef/jabref/releases/download/v5.1/jabref_5.1-1_amd64.deb -O jabref.deb > /dev/null 2>&1
  sudo apt-get --yes install ./jabref.deb > /dev/null 2>&1
  rm -f ./jabref.deb > /dev/null 2>&1
  echo "Done"
else
  echo "JabRef is already installed...   Skip"
fi

# Install Zotero
echo -n "Installation of Zotero...   "
curl -fsSL https://github.com/retorquere/zotero-deb/releases/download/apt-get/deb.gpg.key | sudo apt-key add - > /dev/null 2>&1
sudo sh -c 'echo "deb https://github.com/retorquere/zotero-deb/releases/download/apt-get/ ./" > /etc/apt/sources.list.d/zotero.list'  > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install zotero > /dev/null 2>&1
echo "Done"