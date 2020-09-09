#!/bin/bash

# Spotify
echo -n "Installing Spotify...   "
sudo apt-get --yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common > /dev/null 2>&1
curl -fsSL https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - > /dev/null 2>&1
sudo add-apt-repository --yes "deb http://repository.spotify.com stable non-free" > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install spotify-client > /dev/null 2>&1
echo "Done"

# Multimedia applications
echo -n "Installing multimedia applications...   "
sudo apt-get --yes install vlc > /dev/null 2>&1
echo "Done"