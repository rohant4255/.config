#!/bin/bash
# TODO: Add installation of light
echo 'export PROMPT_COMMAND="pwd > /tmp/whereami"' >> ~/.bashrc
sudo apt-get install xclip
ln -s ~/.config/.gitignore_global .
git config --global core.excludesfile ~/.gitignore_global
