#!/bin/bash

apt-get update

# SSH configuration
echo "SSH Configuration"
SSHD_FILE=/etc/ssh/sshd_config
grep -v "PermitRootLogin" ${SSHD_FILE} > ${SSHD_FILE}
echo "PermitRootLogin yes" >> ${SSHD_FILE}

grep -v "PasswordAuthentication" ${SSHD_FILE} > ${SSHD_FILE}
echo "PasswordAuthentication yes" >> ${SSHD_FILE}

service ssh restart
