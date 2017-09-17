#!/bin/bash

###############################################################################
# Create symbolic links to the actual dotfiles 
###############################################################################

#Where are we run from
_script="$(greadlink -f ${BASH_SOURCE[0]})"
current_dir="$(dirname $_script)"

ln -fs $current_dir/dot.vimrc ~/.vimrc
ln -fs $current_dir/dot.ansible ~/.ansible
ln -fs $current_dir/dot.tmux.conf ~/.tmux.conf
ln -fs $current_dir/dot.bashrc ~/.bashrc
ln -fs $current_dir/dot.gitconfig ~/.gitconfig
ln -fs $current_dir/dot.curlrc ~/.curlrc
ln -fs $current_dir/dot.sshconfig ~/.ssh/config