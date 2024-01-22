#!/usr/bin/env bash

###
# Backs up and restores system state not managed by git or other automation tools.
#
# Usage: backup.sh {create|restore} [backup_file]

# Define the files to backup
files=(
    # ssh
    "$HOME/.ssh/known_hosts"
    "$HOME/.ssh/id_"*

    # gpg
    "$HOME/.gnupg"

    # git user config
    "$HOME/.config/git/user"

    # plain-text git credentials (fallback, not used)
    "$HOME/.git-credentials"

    # kubernetes configs
    "$HOME/.kube"

    # copilot
    "$HOME/.config/github-copilot/hosts.json"
    "$HOME/.config/github-copilot/versions.json"

    # reposync
    "$HOME/.config/reposync/"*.token

    # podman
    "$HOME/.config/containers/auth.json"
    
    # wallpaper
    "$HOME/.local/state/wallpaper.state"

    # dbeaver workspaces
    "$HOME/.local/share/DBeaverData"

    # zoxide db
    "$HOME/.local/share/zoxide/db.zo"
)

# remove missing paths
for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        files=("${files[@]/$file}")
    fi
done

# backup file
backup_file=${2:-"backup.tar.gz"}

# create or restore
if [ "$1" == "create" ]; then
    # Create the backup
    tar -czf $backup_file -C $HOME ${files[@]}
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
