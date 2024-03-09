#!/usr/bin/env bash

# arguments
HOSTALIAS=$1
if [ -z "$HOSTALIAS" ]; then
    echo "Error: missing hostname. Exiting."
    exit 1
fi

# check if sshfs is installed
if ! command -v sshfs &> /dev/null; then
    echo "Error: sshfs is not installed. Exiting."
    exit 1
fi

# exit without doing anything if already mounted
MOUNT_POINT=~/sshfs/$HOSTALIAS
if findmnt "$MOUNT_POINT" &> /dev/null; then
    exit 0
fi

# mount sshfs
echo "Mounting SSHFS for $HOSTALIAS (~/sshfs/$HOSTALIAS)"
mkdir -p ~/sshfs/$HOSTALIAS
sshfs -o allow_other,default_permissions,uid=1000,gid=100 $HOSTALIAS:/ ~/sshfs/$HOSTALIAS
