#!/bin/bash

# Microsoft Visual Studio Code
echo -n "Installing Visual Studio Code...   "
sudo apt-get --yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common > /dev/null 2>&1
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - > /dev/null 2>&1
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'  > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install code > /dev/null 2>&1
echo "Done"

# C and C++
echo -n "Installing build essentials for C and C++...   "
sudo apt-get --yes install build-essential gdb clang lldb lld > /dev/null 2>&1
echo "Done"

# HPC
echo -n "Installing HPC related libraries...   "
sudo apt-get --yes install mpich mpich-doc openmpi-bin libopenmpi-dev libomp-dev libboost-dev libboost-all-dev \
nvidia-cuda-toolkit nvidia-cuda-toolkit-gcc > /dev/null 2>&1
echo "Done"

# CMake
# https://apt.kitware.com/
echo -n "Installing CMake...   "
sudo apt-get --yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common > /dev/null 2>&1
curl -fsSL https://apt.kitware.com/keys/kitware-archive-latest.asc | sudo apt-key add - > /dev/null 2>&1
sudo add-apt-repository --yes "deb https://apt.kitware.com/ubuntu/ focal main" > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get --yes install cmake > /dev/null 2>&1
echo "Done"

# Install development tools
echo -n "Installing misc development tools...   "
sudo apt-get --yes install  kdiff3 umbrello git kcachegrind valgrind massif-visualizer okteta > /dev/null 2>&1
echo "Done"

# Python
echo -n "Installing development environment for Python3...   "
sudo apt-get --yes install python3 python3-venv python3-pip build-essential libssl-dev libffi-dev python3-dev > /dev/null 2>&1
echo "Done"

# Miniconda
if [ -d /home/$SUDO_USER/miniconda3 ] 
then
    echo "Miniconda3 is already installed...   Skip"
else
    echo -n "Installing Miniconda3...   "
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh > /dev/null 2>&1
    # Check permissions after installation
    bash ~/miniconda.sh -b > /dev/null 2>&1
    source /home/$SUDO_USER/miniconda3/bin/activate > /dev/null 2>&1 && conda init > /dev/null 2>&1
    conda config --set auto_activate_base false > /dev/null 2>&1
    rm -rf miniconda.sh > /dev/null 2>&1
    echo "Done"
fi

# Java
echo -n "Installing development environment for Java 14...   "
sudo apt-get --yes install openjdk-14-jdk > /dev/null 2>&1
echo "Done"

# Eclipse for C++ Developers
if [ -d /home/$SUDO_USER/.local/eclipse ] 
then
    echo "Eclipse IDE is already installed...   Skip"
else
    echo -n "Installing Eclipse IDE...   "
    curl -fsSL http://mirror.cc.columbia.edu/pub/software/eclipse/technology/epp/downloads/release/2020-06/R/eclipse-cpp-2020-06-R-linux-gtk-x86_64.tar.gz | tar xz
    mv eclipse /home/$SUDO_USER/.local/eclipse
    if [ ! -f /home/$SUDO_USER/.local/share/applications/eclipse.desktop ]
    then
        mkdir -p /home/$SUDO_USER/.local/share/applications
        touch /home/$SUDO_USER/.local/share/applications/eclipse.desktop
        icon=/home/$SUDO_USER/.local/share/applications/eclipse.desktop
        echo "[Desktop Entry]" >> $icon
        echo "Type=Application" >> $icon
        echo "Name=Eclipse" >> $icon
        echo "Comment=Eclipse Integrated Development Environment" >> $icon
        echo "Icon=/home/$SUDO_USER/.local/eclipse/icon.xpm" >> $icon
        echo "Exec=/home/$SUDO_USER/.local/eclipse/eclipse" >> $icon
        echo "Terminal=false" >> $icon
        echo "Categories=Development;IDE;Java;" >> $icon
        echo "StartupWMClass=Eclipse" >> $icon
    fi
    echo "Done"
fi
