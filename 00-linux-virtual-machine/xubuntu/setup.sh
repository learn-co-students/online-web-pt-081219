#!/bin/bash

# If this script is not being run as root, re-launch with sudo
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Make sure that the system is up to date
apt-get -yq update && apt-get -yq upgrade
