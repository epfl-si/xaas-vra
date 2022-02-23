#!/bin/bash

# Constantes
localFuncScript="/tmp/func.sh"
localScript="/tmp/cloudinit.sh"
debugFile="/tmp/cloudinit.debug"

# Attente que l'application du tag dans NSX soit bien effective
echo "Sleeping until network is available in NSX..."
sleep 30

# Récupération des infos
gitBranch=`cat /tmp/cloud-init_repo-branch`
cloudInitBaseImage=`cat /tmp/cloud-init_base-image`

# Récupération du script
wget https://raw.githubusercontent.com/epfl-si/xaas-vra/${gitBranch}/CloudInit/${cloudInitBaseImage}/cloudinit.sh -O ${localScript}
wget https://raw.githubusercontent.com/epfl-si/xaas-vra/${gitBranch}/CloudInit/func.sh -O ${localFuncScript}

# Si on n'est pas en mode debug
if [ -f ${debugFile} ]
then
    set -x
fi
# Exécution
echo "Executing script..."
chmod u+x ${localScript}
chmod u+x ${localFuncScript}
source ${localFuncScript}
source ${localScript}

# Si on n'est pas en mode debug
if [ ! -f ${debugFile} ]
then
    echo "Cleaning scripts..."
    rm ${$localFuncScript}
    rm ${$localScript}
fi

echo "CloudInit execution done"