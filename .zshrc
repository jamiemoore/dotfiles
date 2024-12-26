################################################################################
# pipx
################################################################################
export PATH="$PATH:$HOME/.local/bin"

################################################################################
# shell options
################################################################################

# Remove % from lines without newline
unsetopt PROMPT_CR PROMPT_SP
# Return unmatched glob as glob
setopt nonomatch

################################################################################
# Don't display the highlighted % for partial lines
################################################################################
PROMPT_EOL_MARK=

################################################################################
# Homebrew
################################################################################
export HOMEBREW=$(brew --prefix)
eval "$($HOMEBREW/bin/brew shellenv)"

################################################################################
# Homebrew Path Changes
################################################################################
export PATH="$HOMEBREW/opt/mysql-client/bin:$PATH"

################################################################################
# Set Default Editor
################################################################################
export EDITOR='vim'

##############################################################################
# Autocomplete
##############################################################################
autoload -Uz compinit
compinit
fpath=(/usr/local/share/zsh-completions $fpath)

##############################################################################
# aws-vault
##############################################################################
eval "$(aws-vault --completion-script-zsh)"
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=osascript
export AWS_ASSUME_ROLE_TTL=1h
export AWS_SESSION_TTL=12h
export AWS_FEDERATION_TOKEN_TTL=12h

##############################################################################
# GPG
##############################################################################
export GPG_TTY=$(tty)

##############################################################################
# function: get aws-vault server mode based on process
##############################################################################
function get_awsvault_server () {
    AWS_VAULT_SERVER=$(ps -ef | awk '$0 ~ /aws-vault/ && $0 ~ /-s/ {for(i=1;i<=NF;i++) if ($i=="exec") print $(i+1)}')
    if [ -n "${AWS_VAULT_SERVER}" ]; then
        echo -n '\uf09c' $AWS_VAULT_SERVER
    fi
}


##############################################################################
# kubectl
##############################################################################
export KUBECONFIG=${HOME}/.kube/config:${HOME}/.kube/openshift
alias kctx="kubectx"
alias kns="kubens"

##############################################################################
# typora
##############################################################################
alias typora="open -a typora"
alias t="open -a typora"

##############################################################################
# ack
##############################################################################
alias ack="ack -i"

##############################################################################
# chamber
##############################################################################
export CHAMBER_KMS_KEY_ALIAS="alias/terraform"

##############################################################################
# homebrew curl
##############################################################################
export PATH="$HOMEBREW/opt/curl/bin:$PATH"

##############################################################################
# Android
##############################################################################
export ANDROID_HOME="$HOME/Library/Android/sdk"

##############################################################################
# Android
##############################################################################
# Setting ANDROID_SDK for android-sdk
export ANDROID_SDK="/Users/$(whoami)/Library/Android/sdk"
# Setting PATH to ANDROID_SDK emulator
export PATH="$PATH:${ANDROID_SDK}/emulator"
# Setting PATH to ANDROID_SDK platform tools
export PATH="$PATH:${ANDROID_SDK}/platform-tools"

##############################################################################
# azure
##############################################################################
az-auth () { aws-azure-login -p $1 --no-prompt ; export AWS_PROFILE=$1 }
az-auth-prompt () { DEBUG=aws-azure-login aws-azure-login -p $1 ; export AWS_PROFILE=$1 }
# DEBUG=aws-azure-login aws-azure-login -p shared --no-prompt

################################################################################
# netstat
################################################################################
netstat () {lsof -nP -iTCP | grep LISTEN}

##############################################################################
# UTC Date
##############################################################################
udate () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d %H:%M:%S" }
us3date () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d:%H:%M:%S" }

##############################################################################
# golang
##############################################################################
export GOPATH="${HOME}/go"
export PATH=$GOPATH/bin:$PATH

# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
# test -d "${GOPATH}" || mkdir "${GOPATH}"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

##############################################################################
# Colima
##############################################################################
# Some apps ignore docker context and use DOCKER_HOST when using colima
export DOCKER_HOST=unix://"$HOME/.colima/default/docker.sock"

##############################################################################
# Switch a proxy on and off
##############################################################################
alias proxyon="export https_proxy=https://localhost:8080"
alias proxystatus="env | grep https_proxy"
alias proxyoff="unset https_proxy"


##############################################################################
# History
##############################################################################
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.

# Fuzzy search history with ctrl-r and fuzzy file open with ctrl-t
eval "$(fzf --zsh)"

##############################################################################
# Autojump
##############################################################################
[ -f $HOMEBREW/etc/profile.d/autojump.sh ] && source $HOMEBREW/etc/profile.d/autojump.sh

##############################################################################
# Mise
##############################################################################
eval "$(mise activate zsh)"

##############################################################################
# Cert Bundle
##############################################################################
# Local RootCA for curl and OpenSSL
# export SSL_CERT_FILE=~/.certs/native_ca_bundle.pem 

##############################################################################
# Vault Aliases
##############################################################################
# alias awp="aws-vault exec prod-admin -- aws"
# alias awn="aws-vault exec nonprod-admin -- aws"
# alias vap="aws-vault exec prod-admin -- "
# alias van="aws-vault exec nonprod-admin -- "


##############################################################################
# Prompt
##############################################################################
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'
setopt prompt_subst

virtualenv_info() {
    [ $VIRTUAL_ENV ] && echo " $(basename $VIRTUAL_ENV)"
}

proxy_info() {
    [ $https_proxy ] && echo " ${https_proxy}"
}

PROMPT='%1d%F{green}$(virtualenv_info)%f%F{blue}${vcs_info_msg_0_}%f%F{red}$(proxy_info)%f %# '


##############################################################################
# Custom
##############################################################################
[ -f ~/.zshrc.custom ] && source ~/.zshrc.custom || true

##############################################################################
# Automatically run tmux
##############################################################################

# If the shell is interactive and we are not in a tmux session
if [[ -o interactive ]]; then
    if [ "$TERM_PROGRAM" != "tmux" ]; then
        # Set the session name 
        session_name="default"
        if [ "$TERM_PROGRAM" == "vscode" ]; then
            session_name=vscode
        fi

        # If the session does not exist, create it
        # else, create a new window
        tmux has-session -t "$session_name" 2>/dev/null
        if [ $? != 0 ]; then
            tmux new-session -d -s ${session_name}
        else
            tmux new-window -t ${session_name}:
        fi
        tmux attach-session -d -t ${session_name}
        exit
    fi
fi