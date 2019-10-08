#!/bin/bash

# If this script is not being run as root, re-launch with sudo
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Make sure that the system is up to date
apt-get -yq update &&
    apt-get -yq upgrade &&

    # Install RVM and Ruby
    apt-get -yq install software-properties-common &&
    apt-add-repository -y ppa:rael-gc/rvm &&
    apt-get -yq install rvm

# Ensure login shell
if [ -f /etc/profile ]; then
    . /etc/profile
fi

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

if [ -f ~/.profile ]; then
    . ~/.profile
fi

grep -qxF "CommandLoginShell=TRUE" ~/.config/xfce4/terminal/terminalrc || echo "CommandLoginShell=TRUE" >> ~/.config/xfce4/terminal/terminalrc
