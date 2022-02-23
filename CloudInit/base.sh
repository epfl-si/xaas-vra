#!/bin/bash

# Constantes
localScript="/tmp/cloudinit.sh"

# Attente que l'application du tag dans NSX soit bien effective
echo "Sleeping until network is available in NSX..."
sleep 30

# Récupération des infos
gitBranch=`cat /tmp/cloud-init_repo-branch`
cloudInitBaseImage=`cat /tmp/cloud-init_base-image`

# Récupération du script
wget https://raw.githubusercontent.com/epfl-si/xaas-vra/${gitBranch}/CloudInit/${cloudInitBaseImage}/cloudinit.sh -O ${localScript}

# Exécution
echo "Executing script..."
chmod u+x ${localScript}
${localScript}

rm ${$localScript}

echo "CloudInit execution done"