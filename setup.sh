#!/bin/bash
# TODO: Add installation of light
echo 'export PROMPT_COMMAND="pwd > /tmp/whereami"' >> ~/.bashrc
sudo apt-get install xclip
ln -s ~/.config/.gitignore_global .
git config --global core.excludesfile ~/.gitignore_global
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old
ln -s $PWD/.tmux.conf ~
# Setup autostart emacs
sudo ln -s ~/.config/startemacs.sh /etc/init.d/
sudo update-rc.d /etc/init.d/startemacs.sh defaults
