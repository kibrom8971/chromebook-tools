#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "Error: Please run this script with sudo."
   exit 1
fi

# Check if it's a Chromebook (simple check for BIOS vendor)
if ! grep -q "Google" /sys/class/dmi/id/bios_vendor 2>/dev/null; then
   echo "Warning: This does not look like a Chromebook. Proceed with caution."
fi

# The Menu
while true; do
    echo "==================================="
    echo "  Chromebook Management Utility"
    echo "==================================="
    echo "1) Update System"
    echo "2) Install Git/Curl"
    echo "3) Clean Temp Files"
    echo "4) Exit"
    read -p "Select an option [1-4]: " choice

    case $choice in
        1) apt update && apt upgrade -y ;;
        2) apt install -y git curl ;;
        3) apt autoremove -y ;;
        4) exit 0 ;;
        *) echo "Invalid option." ;;
    esac
done