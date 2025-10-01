#!/bin/bash

#Author : Praise J. Addy
#Date : 01-Oct-2025

# Automated Apache Installation and Configuration Script
# Works for Ubuntu/Debian systems

set -e  # Exit on error

echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "Installing Apache..."
sudo apt install apache2 -y

echo "Enabling Apache to start on boot..."
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Setting up developer web directory..."

