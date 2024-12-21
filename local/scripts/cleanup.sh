#!/usr/bin/env bash

# exit on error
set -e

###
# Cleanup Script
#
# contains host-specific variables that can not be detected automatically, can be removed once wlr-randr works on wsl
###

# detect distro
distro_id=$(lsb_release -i | awk -F'\t' '{print $2}')
echo "Detected distribution: $distro_id."

# nixos
if [ "$distro_id" == "NixOS" ]; then
  echo "Detected NixOS. Starting cleanup..."

  # nixos profiles
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 3d

  # nixos garbage collection
  sudo nix-store --gc

  echo "NixOS cleanup completed."
fi

# wsl
if [ -n "$WSL_DISTRO_NAME" ]; then
  echo "Detected WSL. Starting cleanup..."

  # reclaim disk space
  sudo sh -c "echo 1 > /proc/sys/vm/compact_memory"

  # reclaim ram
  sudo sh -c "echo 1 > /proc/sys/vm/drop_caches"

  echo "WSL cleanup completed."
fi

# pre-commit
pre-commit gc
# pre-commit nuke
