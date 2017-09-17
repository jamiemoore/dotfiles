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
# Debian, she no like
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

##############################################################################
# screen-256color does not work in RHEL5 so set enviroment before ssh 
##############################################################################
#currently trialing no colors
alias ssh='TERM=screen ssh'

##############################################################################
# macOS Sierra and adding to the keychain
##############################################################################
#ssh -K ~.ssh/id_rsa
#This adds way too many keys, more than five keys causes authentication problems
#ssh-add -A 2&> /dev/null

##############################################################################
# Automatically load ssh-agent and add keys (requires:keychain)
##############################################################################
#eval `keychain -q --timeout 720 --eval id_rsa`

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
#export HISTCONTROL=erasedups
export HISTCONTROL=ignoreboth
export HISTSIZE=-1
export HISTFILESIZE=-1

##############################################################################
# Bash Completion
##############################################################################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

##############################################################################
# Saves Bash History after each command
##############################################################################
shopt -s histappend
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

##############################################################################
# ssh completion using the history 
##############################################################################
if [[ ! -f ~/.bash_history ]]; then
    touch ~/.bash_history
fi
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

##############################################################################
# git prompt 
##############################################################################
export GIT_PROMPT_START="[\u@\h \W]"
export GIT_PROMPT_END="\$"
export GIT_PROMPT_LEADING_SPACE=0
source ~/.bash-git-prompt/gitprompt.sh

##############################################################################
# MySQL Prompt 
##############################################################################
export MYSQL_PS1=$(echo -e "\x1B[33mMySQL\x1B[0m \u@\h [\d]> ")

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

##############################################################################
# Python Virtual Environments 
##############################################################################
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
if [[ -f /usr/bin/virtualenvwrapper.sh ]]; then
    source /usr/bin/virtualenvwrapper.sh 
fi
export PROJECT_HOME="${HOME}/projects"


##############################################################################
# Repeat Function 
##############################################################################
function repeat {
    CMD="${@}" 

    if [[ -z "$CMD" ]]; then
        echo "Requires a command as an argument"
        return 1
    fi
    
    while true; do
        $CMD    
        sleep 1
    done
}


##############################################################################
# Get the SSH Password from the keychain
##############################################################################
#export SSHPASS=`security find-generic-password -w -s ssh_password`

##############################################################################
# Get a GITLAB token
##############################################################################
#export GITLAB_TOKEN=`security find-generic-password -w -s gitlab`

##############################################################################
# Vagrant 
##############################################################################
#export VAGRANT_DEFAULT_PROVIDER=vmware_workstation
export VAGRANT_DEFAULT_PROVIDER=virtualbox

##############################################################################
# Go Development
##############################################################################
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

##############################################################################
# Docker Machine
##############################################################################
#Note that we are using the DNS proxy for the Virtual Machine
#if [[ `docker-machine status default` != "Running" ]]; then
#    docker-machine start default
#fi
#export DMIP=`docker-machine inspect -f {{.Driver.IPAddress}} default`
#export DMDNS=`docker-machine ssh default cat /etc/resolv.conf | cut -d ' ' -f 2`
#eval "$(docker-machine env default)"

##############################################################################
# Docker auto completion and aliases
##############################################################################

if [ ! -f "${HOME}/.docker-completion.sh" ]; then
    curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > ~/.docker-completion.sh
fi

if [ ! -f "${HOME}/.docker-compose-completion.sh" ]; then
    curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > ~/.docker-compose-completion.sh
fi

. ~/.docker-completion.sh
#. ~/.docker-machine-completion.sh
. ~/.docker-compose-completion.sh
alias d=docker
alias dc=docker-compose
#alias dm=docker-machine
complete -F _docker d
#complete -F _docker_machine dm
complete -F _docker_compose dc


##############################################################################
# Docker auto completion and aliases
##############################################################################

if [ ! -f "${HOME}/.kubectl-completion.sh" ]; then
    kubectl completion bash > ~/.kubectl-completion.sh
fi

. ~/.kubectl-completion.sh

alias k=kubectl
alias mk=minikube

_kubectl_completion k _kubectl

#complete -F __start_kubectl k
#complete -F _kubectl k


minikube status 2> /dev/null | grep Running >/dev/null
if [[ $? != 0 ]]; then
    minikube start /dev/null
fi



##############################################################################
# DNS for Docker
##############################################################################

#if [[ `docker inspect -f {{.State.Running}} dnsdock`  == "false" ]]; then
#    docker rm dnsdock >& /dev/null
#    docker inspect tonistiigi/dnsdock > /dev/null || docker pull tonistiigi/dnsdock 
#    docker run -d --name dnsdock -v /var/run/docker.sock:/var/run/docker.sock -p 53:53 tonistiigi/dnsdock -nameserver=${DMDNS}:53 >& /dev/null
#fi
#export DNSDOCKIP=`docker inspect -f {{.NetworkSettings.IPAddress}} dnsdock`
#export DNSDOCKNET=`echo $DNSDOCKIP | cut -d '.' -f 1,2`.0.0

##############################################################################
# Routes for Docker Containers 
##############################################################################
#route -n get $DNSDOCKNET | grep $DMIP >& /dev/null
#if [[ $? != 0 ]]; then
#    sudo route -n add -net $DNSDOCKNET $DMIP >& /dev/null
#fi

##############################################################################
# Resolve the .docker domain from OS X 
##############################################################################
#if [[ ! -d "/etc/resolver" ]]; then
#    sudo mkdir /etc/resolver
#fi

#grep $DNSDOCKIP /etc/resolver/docker >& /dev/null
#if [[ $? != 0 ]]; then
#    sudo sh -c "echo nameserver $DNSDOCKIP > /etc/resolver/docker"
#fi

##############################################################################
# Autojump
##############################################################################
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

##############################################################################
# Passwordless login when password required
##############################################################################

export NOPASSWORDDOMAIN="nopasswd.local"

function ssh {

    if [[ "$@" == *"$NOPASSWORDDOMAIN"* ]]
	then
        sshpass -e /usr/bin/ssh "$@"
	else
		/usr/bin/ssh "$@"
	fi

}

##############################################################################
# Ansible
##############################################################################
export ANSIBLE_HOST_KEY_CHECKING=False

##############################################################################
# Typora
##############################################################################
alias typora="open -a typora"
alias t="open -a typora"
alias ack="ack -i"

