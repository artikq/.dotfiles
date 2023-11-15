#!/bin/bash

# install ansible
echo 'installing required packages'
sudo -S dnf install python3 pipx
pipx install ansible
pipx inject --include-apps ansible ansible-core
pipx inject --include-apps ansible argcomplete
