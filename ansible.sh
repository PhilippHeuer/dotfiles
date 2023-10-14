#!/usr/bin/env bash

# run ansible playbook
ansible-playbook \
    --connection=local \
    --inventory 127.0.0.1, \
    --ask-become-pass \
    ansible/playbook.yml
