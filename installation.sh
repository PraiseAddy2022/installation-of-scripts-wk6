#!/bin/bash
# Package Installation Script (Ubuntu/Debian & CentOS/RHEL)

#Author : Praise J. Addy
#Date : 01-Oct-2025

set -e
. /etc/os-release

PKGS="wget net-tools sysstat finger gcc make python3 git"

if [[ $ID =~ (ubuntu|debian) ]]; then
    sudo apt-get update -y
    for p in $PKGS; do
        dpkg -s $p &>/dev/null || sudo apt-get install -y $p
    done
fi

if [[ $ID =~ (centos|rhel) ]]; then
    rpm -q epel-release &>/dev/null || sudo dnf install -y epel-release
    for p in $PKGS; do
        rpm -q $p &>/dev/null || sudo dnf install -y $p
    done
fi

echo "✅ All packages are installed."
