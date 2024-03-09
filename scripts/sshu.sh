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

# unmount
echo "Unmounting SSHFS for $HOSTALIAS"
umount ~/sshfs/$HOSTALIAS
