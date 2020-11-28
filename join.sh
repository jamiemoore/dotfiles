#!/bin/bash
###############################################################################
# join.sh - Create symbolic links to the actual dotfiles
###############################################################################
set -euo pipefail
IFS=$'\n\t'
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -fs $SCRIPTDIR/dot.vimrc ~/.vimrc
ln -fs $SCRIPTDIR/dot.ansible.cfg ~/.ansible.cfg
ln -fs $SCRIPTDIR/dot.tmux.conf ~/.tmux.conf
ln -fs $SCRIPTDIR/dot.gitconfig ~/.gitconfig
ln -fs $SCRIPTDIR/dot.curlrc ~/.curlrc
ln -fs $SCRIPTDIR/dot.zshrc ~/.zshrc
touch ~/.zshrc.custom
ln -fs $SCRIPTDIR/dot.sshconfig ~/.ssh/config
ln -fs ~/Dropbox/sshconfig ~/.ssh/config.d
