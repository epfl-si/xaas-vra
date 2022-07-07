#!/bin/bash

# Mise à jour des packages
apt-get update
# Pour ne pas avoir les demandes interactives pour l'install (avec entrées utilisateurs)
export DEBIAN_FRONTEND=noninteractive
apt-get -yq upgrade

# Activation du SSH
echo "Activating SSH..."
systemctl enable ssh
systemctl start ssh
