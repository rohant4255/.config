#!/bin/bash
# Util functions for script
append_once() { # Appends string ($1) to file ($2) if it doesn't exist in the file
  echo $1 >> $2
}

# Add ability keep track of last directory
append_once 'export PROMPT_COMMAND="pwd > /tmp/whereami"' ~/.bashrc
append_once 'export PROMPT_COMMAND="pwd > /tmp/whereami"' ~/.zshrc

# Set up alias
append_once 'source ~/.config/.bash_alias' ~/.profile
# echo 'source ~/.config/.bash_alias' >> ~/.profile

# Install emacs dependencies
sudo apt-get install xclip clangd

# Set up ignores for git
# ln -s ~/.config/.gitignore_global .
# git config --global core.excludesfile ~/.gitignore_global

# Set up tmux config
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old
ln -s $PWD/.tmux.conf ~

# Setup autostart emacs
sudo ln -s ~/.config/startemacs.sh /etc/init.d/
sudo update-rc.d /etc/init.d/startemacs.sh defaults
