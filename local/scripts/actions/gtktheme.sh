#!/usr/bin/env bash

gsettings set org.gnome.desktop.interface color-scheme prefer-dark > /dev/null 2>&1 || true
gsettings set org.gnome.desktop.interface gtk-theme {{ .GtkTheme }} > /dev/null 2>&1 || true
gsettings set org.gnome.desktop.interface icon-theme {{ .IconTheme }} > /dev/null 2>&1 || true
gsettings set org.gnome.desktop.interface cursor-theme {{ .CursorTheme }} > /dev/null 2>&1 || true
