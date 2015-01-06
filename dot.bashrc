# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
##############################################################################
# Configure a 256 Colour Terminal
##############################################################################
export TERM="screen-256color" #as above END key fails to work in vim
#export TERM="xterm" 
#export TERM="xterm-256color" 
alias tmux='tmux -2'

##############################################################################
# Standard Redhat Root Safety Aliases
##############################################################################
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

##############################################################################
# Standard Redhat Helpful Aliases
##############################################################################
alias l.='ls --color -d .*'
alias ll='ls --color -l'
alias vi='vim'
alias ls='ls --color'
# Debian, she no like
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

##############################################################################
# screen-256color does not work in RHEL5 so set enviroment before ssh 
##############################################################################
#currently trialing no colors
alias ssh='TERM=screen ssh'

##############################################################################
# Automatically load ssh-agent and add keys (requires:keychain)
##############################################################################
eval `keychain -q --timeout 720 --eval id_rsa`

##############################################################################
# Allows aliases to work with sudo, eg sudo ll
##############################################################################
alias sudo='sudo '

##############################################################################
# Set the default editor to VIM
##############################################################################
export EDITOR=vim

##############################################################################
# Bash history size and duplicate options 
##############################################################################
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000

##############################################################################
# Saves Bash History after each command
##############################################################################
shopt -s histappend
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

##############################################################################
# ssh completion using the history 
##############################################################################
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

##############################################################################
# git prompt 
##############################################################################
export GIT_PROMPT_START="[\u@\h \W]"
export GIT_PROMPT_END="\$"
export GIT_PROMPT_LEADING_SPACE=0
source ~/.bash-git-prompt/gitprompt.sh

##############################################################################
# User Prompt Colour Selector - not a fan of this when combined with tmux
##############################################################################
#if [[ "$DISPLAY" == *":0"* ]] ; then
#    if type -p tput > /dev/null 2>&1 ; then
#        _bcol="$(tput bold 2> /dev/null;tput setaf 4 2> /dev/null)"
#        _sgr0="$(tput sgr0 2> /dev/null)"
#        PS1="\[$_bcol\]$PS1\[$_sgr0\]"
#        PS2="\[$_bcol\]$PS2\[$_sgr0\]"
#        unset _bcol _sgr0
#    fi
#else
#    if type -p tput > /dev/null 2>&1 ; then
#        _bcol="$(tput bold 2> /dev/null;tput setaf 2 2> /dev/null)"
#        _sgr0="$(tput sgr0 2> /dev/null)"
#        PS1="\[$_bcol\]$PS1\[$_sgr0\]"
#        PS2="\[$_bcol\]$PS2\[$_sgr0\]"
#        unset _bcol _sgr0
#    fi
#fi

##############################################################################
# Unset LS_COLOR so that the term colours are correctly set
##############################################################################
export LS_COLORS=

