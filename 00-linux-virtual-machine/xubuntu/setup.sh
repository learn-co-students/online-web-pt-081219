#!/bin/bash

# Grab the username of the current user, if it hasn't been passed in as an argument
username=${1:-$(whoami)}

# Relaunch this script with sudo
[ "$UID" -eq 0 ] || exec sudo "$0" "${username}"

# Make sure that the system is up to date
apt-get -yq update &&
    apt-get -yq upgrade &&

    # Make sure that required tools are installed: RVM requires gnupg2
    # and curl; git is just good to have
    apt-get -yq install gnupg2 curl git &&

    ####
    ## Setup Configuration files
    ####

    # When RVM installs ruby, it's going to run a script that involves running sudo. This script
    # will only work if run from an interactive shell and not from within this bash script--this
    # work around makes sudo not ask for a password, so that we can run the RVM from within this
    # script.
    { grep -qxF "${username} ALL=(ALL) NOPASSWD: ALL" /etc/sudoers || echo "${username} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; } &&

    # Download the flatiron bash_profile
    su -l ${username} -c 'if [ -f ~/.profile ]; then mv ~/.profile{,.bak}; fi' &&
    su -l ${username} -c 'wget https://raw.githubusercontent.com/learn-co-students/online-web-pt-081219/master/00-linux-virtual-machine/xubuntu/linux_bash_profile -O ~/.profile' &&

    # Tell the XFCE4 terminal emulated to use a login shell
    su -l ${username} -c 'grep -qxF "[Configuration]" ~/.config/xfce4/terminal/terminalrc || echo "[Configuration]" >> ~/.config/xfce4/terminal/terminalrc' &&
    su -l ${username} -c 'grep -qxF "CommandLoginShell=TRUE" ~/.config/xfce4/terminal/terminalrc || echo "CommandLoginShell=TRUE" >> ~/.config/xfce4/terminal/terminalrc' &&

    # Download some more flatiron dotfiles
    su -l ${username} -c 'wget https://raw.githubusercontent.com/flatiron-school/dotfiles/master/irbrc -O ~/.irbrc' &&
    su -l ${username} -c 'wget https://raw.githubusercontent.com/flatiron-school/dotfiles/master/ubuntu-gitignore -O ~/.gitignore' &&
    su -l ${username} -c 'wget https://raw.githubusercontent.com/flatiron-school/dotfiles/master/linux_gitconfig -O ~/.gitconfig' &&

    ####
    ## Install User Dev Tools
    ####

    # Install RVM
    su -l ${username} -c 'gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB' &&
    su -l ${username} -c 'hash rvm 2>/dev/null || wget -q -O - https://get.rvm.io | bash' &&

    # Install ruby
    su -l ${username} -c 'hash ruby 2>/dev/null || rvm install ruby' &&
    # By default don't parse rdoc
    su -l ${username} -c 'echo "gem: --no-document" >> $HOME/.gemrc' &&
    # Install the needed gems
    su -l ${username} -c 'gem update --system' &&
    su -l ${username} -c 'gem install learn-co' &&
    su -l ${username} -c 'gem install phantomjs' &&
    apt-get -yq install libpq-dev &&
    su -l ${username} -c 'gem install pg' &&
    su -l ${username} -c 'gem install sqlite3' &&
    su -l ${username} -c 'gem install bundler' &&
    su -l ${username} -c 'gem install rails' &&

    # Some problems come up if ~/.netrc doesn't exist
    su -l ${username} -c 'touch ~/.netrc && chmod 0600 ~/.netrc' &&

    # Install NVM
    su -l ${username} -c 'type nvm >/dev/null 2>&1 || wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash' &&
    # Install node
    su -l ${username} -c 'hash node 2>/dev/null || nvm install node' &&
    # Install create-react-app
    su -l ${username} -c 'hash create-react-app 2>/dev/null || npm install -g create-react-app' &&
    # Install phantomjs
    su -l ${username} -c 'hash phantomjs 2>/dev/null || npm install -g phantomjs' &&

    echo "

AUTO SETUP COMPLETE!!!

Please run \"learn whoami\" to finish setting up the learn gem.

" &&

    # Drop the user in a login shell
    su -l ${username}
