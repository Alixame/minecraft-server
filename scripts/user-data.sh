#!/bin/bash
# EC2 user-data: Ubuntu 24.04 arm64 (t4g.medium)
set -e
fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
apt-get update && apt-get install -y docker.io
systemctl enable --now docker
mkdir -p /opt/minecraft/data && touch /opt/minecraft/mods.txt
/opt/minecraft/run.sh 2>/dev/null || true
