#!/bin/bash

# Mise à jour des packages
apt-get update
apt-get upgrade

# Activation du SSH
echo "Activating SSH..."
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl enable ssh
systemctl restart ssh
