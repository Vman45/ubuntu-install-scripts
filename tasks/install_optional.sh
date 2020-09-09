#!/bin/bash

# HW and VM Server Access
echo "Installing IcedTea and Virt-Viewer...   "
sudo apt-get --yes install icedtea-plugin virt-viewer
echo "Done"

# NextCloud
echo "Installing NextCloud client and Dolphin plugin...   "
sudo add-apt-repository --yes --update ppa:nextcloud-devs/client
sudo apt-get update
sudo apt-get --yes install nextcloud-client nextcloud-client-dolphin
echo "Done"
