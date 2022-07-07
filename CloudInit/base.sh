#!/bin/bash

# Constantes
localFuncScript="/tmp/func.sh"
localScript="/tmp/cloudinit.sh"
debugFile="/tmp/cloud-init.debug"

# Si on n'est pas en mode debug
if [ -f ${debugFile} ]
then
    set -x
fi


# Récupération des infos
gitBranch=`cat /tmp/_repo-branch`
cloudInitBaseImage=`cat /tmp/_base-image`

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

echo "Creating file to deny CloudInit future executions"
touch /etc/cloud/cloud-init.disabled

echo "CloudInit execution done, rebooting"
reboot