#!/bin/bash

echo "
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                             "

set -e # Exit if anything fails

echo "[*] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[*] Installing basic deps..."
sudo apt install -y curl git unzip tar stow

echo "[*] Running essential setup scripts..."

chmod +x setup/*.sh

./setup/00-essentials.sh
./setup/01-nvidia.sh
./setup/02-dwm.sh
./setup/99-final-touches.sh

echo "
██████╗ ██╗   ██╗███████╗
██╔══██╗██║   ██║██╔════╝
██████╔╝██║   ██║█████╗  
██╔═══╝ ██║   ██║██╔══╝  
██║     ╚██████╔╝███████╗
╚═╝      ╚═════╝ ╚══════╝

All Done! Reboot & Login into DWM :)
"
