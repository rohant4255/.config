#!/bin/zsh
WHEREAMI=$(cat /tmp/whereami)
gnome-terminal --working-directory="$WHEREAMI"
