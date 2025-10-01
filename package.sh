#!/bin/bash
# Package Installation Script for Ubuntu & CentOS

#Author : Praise J. Addy
#Date : 01-Oct-2025

set -e

# Detect OS
. /etc/os-release
OS=$ID

if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    sudo apt-get update -y
    sudo apt-get install -y wget net-tools sysstat finger gcc make python3 git
fi

if [[ "$OS" == "centos" || "$OS" == "rhel" ]]; then
    sudo dnf install -y epel-release
    sudo dnf install -y wget net-tools sysstat finger gcc make python3 git
fi

echo "✅ Package installation complete!"
