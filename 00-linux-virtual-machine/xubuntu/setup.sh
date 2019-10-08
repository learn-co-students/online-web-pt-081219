#!/bin/bash

# If this script is not being run as root, re-launch with sudo
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Make sure that the system is up to date
apt-get -yq update &&
    apt-get -yq upgrade &&

    # Install RVM and Ruby
    apt-get -yq install software-properties-common &&
    apt-add-repository -y ppa:rael-gc/rvm &&
    apt-get -yq install rvm &&

    # Ensure login shell
    source /etc/profile && source ~/.profile &&
    grep -qxF "CommandLoginShell=TRUE" ~/.config/xfce4/terminal/terminalrc || echo "CommandLoginShell=TRUE" >> ~./config/xfce4/terminal/terminalrc
