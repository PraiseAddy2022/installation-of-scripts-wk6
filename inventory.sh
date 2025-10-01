#!/bin/bash
# Server Inventory Script (Ubuntu/Debian & CentOS/RHEL)

#Author : Praise J. Addy
#Date : 01-Oct-2025

OUTPUT="server_inventory_$(hostname)_$(date +%F).txt"

{
  echo "=== SERVER INVENTORY REPORT ==="
  echo "Hostname : $(hostname)"
  echo "OS       : $(. /etc/os-release;)"
  echo "Kernel   : $(uname -r)"
  echo "Uptime   : $(uptime -p)"
  echo "Date     : $(date)"
  echo

  echo "--- CPU ---"
  lscpu | grep -E 'Model name|Architecture|^CPU\(s\):'
  echo

  echo "--- MEMORY ---"
  free -h
  echo

  echo "--- DISK ---"
  df -hT --total | grep -E "Filesystem|total"
  echo

  echo "--- NETWORK ---"
  ip -o -4 addr show | awk '{print $2, $4}'
  echo

  echo "--- TOP 5 CPU PROCESSES ---"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
  echo

  echo "--- PACKAGE COUNT ---"
  if command -v dpkg &>/dev/null; then
    echo "Debian/Ubuntu packages: $(dpkg -l | wc -l)"
  elif command -v rpm &>/dev/null; then
    echo "RHEL/CentOS packages: $(rpm -qa | wc -l)"
  fi
} > "$OUTPUT"

echo "✅ Inventory saved to $OUTPUT"
