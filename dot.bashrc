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
# Enable Coloured terminal commands on OS X
##############################################################################
export CLICOLOR=1

##############################################################################
# Standard Redhat Root Safety Aliases
##############################################################################
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

##############################################################################
# Standard Redhat Helpful Aliases
##############################################################################
alias l.='ls -d .*'
alias ll='ls -l'
alias vi='vim'
alias ls='ls '

##############################################################################
# screen-256color does not work in RHEL5 so set enviroment before ssh
##############################################################################
alias ssh='TERM=screen ssh'

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
export HISTCONTROL=ignoreboth
export HISTSIZE=-1
export HISTFILESIZE=-1

##############################################################################
# Bash Completion
##############################################################################
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#fi

##############################################################################
# Saves Bash History after each command
##############################################################################
shopt -s histappend
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

##############################################################################
# git prompt
##############################################################################
export GIT_PROMPT_START="[\$http_proxy][\$AWS_PROFILE][\u@\h \W]"
export GIT_PROMPT_END="\$"
export GIT_PROMPT_LEADING_SPACE=0
source ~/.bash-git-prompt/gitprompt.sh

