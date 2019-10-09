#!/bin/bash

username=${1:-$(whoami)}

# If this script is not being run as root, re-launch with sudo
[ "$UID" -eq 0 ] || exec sudo "$0" "${username}"

# Make sure that the system is up to date
apt-get -yq update &&
    apt-get -yq upgrade &&

    # Install RVM and Ruby
    apt-get -yq install software-properties-common &&
    apt-add-repository -y ppa:rael-gc/rvm &&
    apt-get -yq install rvm &&

    su -l ${username} -c 'wget https://raw.githubusercontent.com/flatiron-school/dotfiles/master/linux_bash_profile -O ~/.bash_profile' &&

# Ensure login shell
    su -l ${username} -c 'grep -qxF "CommandLoginShell=TRUE" ~/.config/xfce4/terminal/terminalrc || echo "CommandLoginShell=TRUE" >> ~/.config/xfce4/terminal/terminalrc' &&

# Start a login shell as the ${username}
    su -l ${username} -c 'hash ruby 2>/dev/null || rvm install ruby' &&
    su -l ${username} -c 'echo "gem: --no-ri --no-rdoc" > $HOME/.gemrc' &&
    su -l ${username} -c 'gem update --system' &&
    su -l ${username} -c 'gem install learn-co' &&
    su -l ${username} -c 'gem install phantomjs' &&
    apt-get -yq install libpq-dev &&
    su -l ${username} -c 'gem install pg' &&
    su -l ${username} -c 'gem install sqlite3' &&
    su -l ${username} -c 'gem install bundler' &&
    su -l ${username} -c 'gem install rails' &&

    su -l ${username} -c 'touch ~/.netrc && chmod 0600 ~/.netrc' &&

    su -l ${username} -c 'hash nvm 2>/dev/null || wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash' &&
    su -l ${username} -c 'source ~/.bashrc && nvm'
