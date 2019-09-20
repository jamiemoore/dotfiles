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
#ln -fs $SCRIPTDIR/dot.bashrc ~/.bashrc

touch ~/.zshrc.custom

#If we need a custom ssh config file that can't be checked into git
if [[ -f $SCRIPTDIR/dot.sshconfig.custom ]]; then
    ln -fs $SCRIPTDIR/dot.sshconfig.custom ~/.ssh/config
else
    ln -fs $SCRIPTDIR/dot.sshconfig ~/.ssh/config
fi
