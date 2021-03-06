> The GitHub repository is just a mirror. The main repository can be found [here](https://gitlab.com/akutschi/ubuntu-install-scripts)

# Ubuntu / KDE Neon Quick Application Installer

Since I install at least once or twice a year a system (laptop, desktop, VM) from scratch and since I am very lazy installing everything by hand I wrote this little dead simple shell script that installs the programs I use most in [KDE Neon](https://neon.kde.org/).

Of course it could be used just a long list with applications to install and loop over this list, but I rather like to have sorted everything into separate files so that the review of the programs can be done easily.

## Coverage

The scripts are tested on KDE Neon based on Ubuntu 20.04 LTS (Focal Fossa). Since there are no specific KDE Neon libraries used it should work without any hassle with Ubuntu 20.04. Updates will be made for fixing bugs, adding applications and after each rebase of KDE Neon to the latest Ubuntu LTS, which is after the first point release of a LTS.

## Applications

- Eclipse
- CMake
- Visual Studio Code
- Skype
- Microsoft Teams
- Slack
- Signal
- Element (Matrix client)
- Zoom
- Spotify
- KeePassXC
- Dropbox
- Terraform
- Vagrant
- Docker
- VirtualBox
- Ansible
- Anaconda/Miniconda
- ...

## How to use

- Clone or download
- Review packages
- Modify
- Run with `chmod +x ./install.sh && sudo ./install.sh`
- Wait a couple of minutes

## Questions?

If you like this somehow and you have a question or a specific request just open a ticket. 

# To Do

- Hugo extended
- Matlab
- Minikube
- Helm



