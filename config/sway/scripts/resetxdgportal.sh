#!/usr/bin/env bash

# possible directories for portal binaries
portal_dirs=("/usr/lib" "/usr/libexec")

# find directory
portal_dir=""
for dir in "${portal_dirs[@]}"; do
    if [ -x "$dir/xdg-desktop-portal" ]; then
        portal_dir="$dir"
        break
    fi
done

# kill all xdg portals
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-lxqt
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal

# start in proper order
sleep 1
$portal_dir/xdg-desktop-portal &
sleep 2
$portal_dir/xdg-desktop-portal-wlr &
