#!/usr/bin/env bash

# fix corrupted nix store paths
nix-store --verify --check-contents --repair
