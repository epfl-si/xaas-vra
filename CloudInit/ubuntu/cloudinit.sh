#!/bin/bash

function holdUnHoldPackages
{
    let action=$1

    for p in "unattended-upgrades"
    do
        echo "${action} ${p} package..."
        apt-mark ${action} $p
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
