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

if [[ -f $SCRIPTDIR/dot.sshconfig.custom ]]; then
    ln -fs $SCRIPTDIR/dot.sshconfig.custom ~/.ssh/config
else
    ln -fs $SCRIPTDIR/dot.sshconfig ~/.ssh/config
fi

if [[ -f $SCRIPTDIR/dot.bashrc.custom ]]; then
    ln -fs $SCRIPTDIR/dot.bashrc.custom ~/.customrc
fi


if [[ -f /Users ]]; then
    ln -fs $SCRIPTDIR/dot.bashrc ~/.bashrc.mac
else
    ln -fs $SCRIPTDIR/dot.bashrc ~/.bashrc
fi




