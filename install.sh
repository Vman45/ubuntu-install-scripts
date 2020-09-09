#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi

. ./tasks/basic.sh

. ./tasks/productivity.sh

. ./tasks/entertainment.sh

. ./tasks/communication.sh

. ./tasks/devops.sh

. ./tasks/development.sh

echo "Awesome, everything is done!"
echo
