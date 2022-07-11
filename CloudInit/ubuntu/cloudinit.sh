#!/bin/bash

function holdUnHoldPackages {
    
    for p in "unattended-upgrades"
    do
        echo "$1 ${p} package..."
        apt-mark $1 $p
    done
}


# Mise à jour des packages
apt-get update

# On bloque certains package pour qu'ils ne soient pas mis à jour car ils demandent une intervention utilisateur
holdUnHoldPackages "hold"

# Pour ne pas avoir les demandes interactives pour l'install (avec entrées utilisateurs). 
# On met quand même ceci malgré le "hold" des packages, au cas où.
export DEBIAN_FRONTEND=noninteractive
apt-get -yq upgrade

holdUnHoldPackages "unhold"

# Activation du SSH
echo "Activating SSH..."
systemctl enable ssh
systemctl start ssh
