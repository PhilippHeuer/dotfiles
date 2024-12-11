#!/usr/bin/env bash

###
# Backs up and restores system state not managed by git or other automation tools.
#
# Usage: backup.sh {create|restore} [backup_file]

# Define the files to backup
files=(
  # ssh
  ".ssh/known_hosts"
  ".ssh/id_"*
  ".ssh/servers"

  # gpg
  ".gnupg"

  # git user config
  ".config/git/user"

  # plain-text git credentials (fallback, not used)
  ".git-credentials"

  # kubernetes configs
  ".kube"

  # k9s
  ".local/share/k9s"

  # gradle properties
  ".gradle/gradle.properties"

  # neovim
  ".local/share/nvim/lazy"
  ".local/state/nvim/lazy"

  # copilot
  ".config/github-copilot/hosts.json"
  ".config/github-copilot/versions.json"

  # reposync
  ".config/reposync/"*.token

  # podman
  ".config/containers/auth.json"

  # wallpaper
  ".local/state/waypaper"

  # fzf
  ".local/share/fzf/history"

  # vault
  ".local/state/vault"

  # gsettings
  ".config/dconf/user"

  # zoxide db
  #".local/share/zoxide/db.zo"

  # atuin
  #".local/share/atuin/history.db"
  #".local/share/atuin/key"

  # dbeaver workspaces
  ".local/share/DBeaverData"

  # chatterino
  ".local/share/chatterino"

  # qbittorrent
  ".config/qBittorrent/categories.json"
  ".config/qBittorrent/watched_folders.json"
  ".local/share/qBittorrent"

  # slack
  ".config/Slack"

  # gramps
  ".config/gramps"
)

filtered_files=()
for file in "${files[@]}"; do
  expanded_files=( $file )

  for f in "${expanded_files[@]}"; do
    if [ -e "$f" ]; then
      filtered_files+=("$f")
    fi
  done
done

# backup file
backup_file=${2:-"backup.tar.gz"}

# create or restore
if [ "$1" == "create" ]; then
  echo "Backing up the following files:"
  for file in "${filtered_files[@]}"; do
    echo "  $file"
  done

  # Create the backup
  tar -czf $backup_file -C $HOME ${filtered_files[@]}
  echo "Backup created in $backup_file"
elif [ "$1" == "restore" ]; then
  # Restore the backup
  if [ -f $backup_file ]; then
    tar -xvzf $backup_file -C $HOME
    echo "Backup restored from $backup_file"
  else
    echo "Backup file $backup_file does not exist"
  fi
else
  echo "Usage: $0 {create|restore} [backup_file]"
fi
