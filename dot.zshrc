##############################################################################
# PATH
##############################################################################
export PATH=/usr/local/opt/curl/bin:$HOME/bin:/usr/local/bin:$PATH

##############################################################################
# Autocomplete
##############################################################################
fpath=(/usr/local/share/zsh-completions $fpath)

##############################################################################
# homebrew python
##############################################################################
# if [ -d $(brew --prefix)/opt/python/libexec/bin ]; then
#     export PATH=$(brew --prefix)/opt/python/libexec/bin:$PATH
# fi

##############################################################################
# shell options
##############################################################################

# Remove % from lines without newline
unsetopt PROMPT_CR PROMPT_SP
# Return unmatched glob as glob
setopt nonomatch


##############################################################################
# direnv
##############################################################################
eval "$(direnv hook zsh)"
# This turns off the output to stdout
export DIRENV_LOG_FORMAT=


##############################################################################
# Don't display the highlighted % for partial lines
##############################################################################
PROMPT_EOL_MARK=''

##############################################################################
# oh-my-zsh
##############################################################################

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

##############################################################################
# zsh theme: powerlevel9k
##############################################################################
ZSH_THEME="powerlevel10k/powerlevel10k"

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
# function: get kube context and ns
##############################################################################
function get_kube_info () {
    KUBE_CONTEXT=$(kubectl config current-context | rev | cut -d'/' -f 1 | rev)
    KUBE_NS=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    if [ -z "${KUBE_NS}" ]; then
        KUBE_NS="default"
    fi
    if [ -n "${KUBE_CONTEXT}" ]; then
        echo -n '\uf473' ${KUBE_CONTEXT} '\ue79b' ${KUBE_NS}
    fi
}

POWERLEVEL9K_CUSTOM_AWSVAULT=get_awsvault_server
POWERLEVEL9K_CUSTOM_AWSVAULT_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_AWSVAULT_BACKGROUND="014"

#POWERLEVEL9K_AWS=get_awsvault_server
POWERLEVEL9K_AWS_FOREGROUND="black"
POWERLEVEL9K_AWS_BACKGROUND="014"

POWERLEVEL9K_CUSTOM_KUBE=get_kube_info
POWERLEVEL9K_CUSTOM_KUBE_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_KUBE_BACKGROUND="blue"

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders
POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir anaconda aws custom_awsvault custom_kube vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_DIR_HOME_BACKGROUND="green"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="green"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="green"

##############################################################################
# oh my zsh: plugins
##############################################################################
plugins=(osx common-aliases git docker autojump aws kubectl zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
export PATH=/usr/local/opt/curl/bin:$PATH

##############################################################################
# AWS Less
##############################################################################
source <(awless completion zsh)

##############################################################################
# Ruby
##############################################################################
eval "$(rbenv init -)"

##############################################################################
# Node
##############################################################################
eval "$(nodenv init -)"

##############################################################################
# Python
##############################################################################
eval "$(pyenv init -)"
export PATH="$PATH:/Users/jamie/.local/bin"

##############################################################################
# Android
##############################################################################
export ANDROID_HOME="$HOME/Library/Android/sdk"

##############################################################################
# Java
##############################################################################
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
alias java8='export JAVA_HOME=$JAVA_8_HOME'
# Lets set to 8 and see how we go
export JAVA_HOME=$JAVA_8_HOME

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
auth () { aws-azure-login -p $1 --no-prompt ; export AWS_PROFILE=$1 }
auth-prompt () { DEBUG=aws-azure-login aws-azure-login -p $1 ; export AWS_PROFILE=$1 }
# DEBUG=aws-azure-login aws-azure-login -p shared --no-prompt

##############################################################################
# netstat
##############################################################################
netstat () {lsof -nP -iTCP | grep LISTEN}

##############################################################################
# UTC Date
##############################################################################
udate () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d %H:%M:%S" }
us3date () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d:%H:%M:%S" }

##############################################################################
# golang
##############################################################################
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
