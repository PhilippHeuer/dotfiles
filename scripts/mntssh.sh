#!/usr/bin/env bash

# arguments
HOSTALIAS=$1
ACTION=$2
if [ -z "$HOSTALIAS" ]; then
    echo "Error: missing hostname. Exiting."
    exit 1
fi

# mount sshfs
case "$ACTION" in
    "mount")
        echo "Mounting SSHFS for $HOSTALIAS (~/sshfs/$HOSTALIAS)"
        mkdir -p ~/sshfs/$HOSTALIAS
        sshfs -o default_permissions,uid=1000,gid=100 $HOSTALIAS:/ ~/sshfs/$HOSTALIAS
        ;;
    "umount")
        echo "Unmounting SSHFS for $HOSTALIAS"
        umount ~/sshfs/$HOSTALIAS
        ;;
    *)
        echo "Error: invalid action ($ACTION). Exiting."
        exit 1
        ;;
esac
