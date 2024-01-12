#!/usr/bin/env bash

###
# Backs up and restores system state not managed by git or other automation tools.
#
# Usage: backup.sh {create|restore} [backup_file]

# Define the files to backup
files=(
    # ssh
    "~/.ssh/known_hosts"
    "~/.ssh/id_*"

    # gpg
    "~/.gnupg"

    # plain-text git credentials (fallback, not used)
    "~/.git-credentials"

    # kubernetes configs
    "~/.kube"

    # copilot
    "~/.config/github-copilot/hosts.json"
    "~/.config/github-copilot/versions.json"
)

# backup file
backup_file=${2:-"backup.tar.gz"}

# create or restore
if [ "$1" == "create" ]; then
    # Create the backup
    tar -czf $backup_file ${files[@]}
    echo "Backup created in $backup_file"
elif [ "$1" == "restore" ]; then
    # Restore the backup
    if [ -f $backup_file ]; then
        tar -xzf $backup_file -C ~/
        echo "Backup restored from $backup_file"
    else
        echo "Backup file $backup_file does not exist"
    fi
else
    echo "Usage: $0 {create|restore} [backup_file]"
fi
