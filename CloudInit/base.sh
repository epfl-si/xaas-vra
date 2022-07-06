#!/bin/bash

# Constantes
localFuncScript="/root/cloud-init/func.sh"
localScript="/root/cloud-init/cloudinit.sh"
debugFile="/root/cloud-init/cloud-init.debug"

# Si on n'est pas en mode debug
if [ -f ${debugFile} ]
then
    set -x
fi

# Attente que l'application du tag dans NSX soit bien effective
#echo "Sleeping until network is available in NSX..."
#sleep 30

# Récupération des infos
gitBranch=`cat /root/cloud-init/_repo-branch`
cloudInitBaseImage=`cat /root/cloud-init/_base-image`

# Récupération du script
wget https://raw.githubusercontent.com/epfl-si/xaas-vra/${gitBranch}/CloudInit/${cloudInitBaseImage}/cloudinit.sh -O ${localScript}
wget https://raw.githubusercontent.com/epfl-si/xaas-vra/${gitBranch}/CloudInit/func.sh -O ${localFuncScript}


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