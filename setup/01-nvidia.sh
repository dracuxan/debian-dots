#!/bin/bash

set -e

echo "[*] Installing NVIDIA Drivers for RTX 3050..."
sudo apt install -y firmware-misc-nonfree
sudo apt install -y nvidia-driver nvidia-settings

echo "[*] Reboot after this!"
