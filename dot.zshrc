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
if [ -d $(brew --prefix)/opt/python/libexec/bin ]; then
    export PATH=$(brew --prefix)/opt/python/libexec/bin:$PATH
fi

##############################################################################
# shell options
##############################################################################

# Remove % from lines without newline
unsetopt PROMPT_CR PROMPT_SP

##############################################################################
# oh-my-zsh
##############################################################################

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

##############################################################################
# zsh theme: powerlevel9k
##############################################################################
ZSH_THEME="powerlevel9k/powerlevel9k"

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

POWERLEVEL9K_CUSTOM_KUBE=get_kube_info
POWERLEVEL9K_CUSTOM_KUBE_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_KUBE_BACKGROUND="blue"

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders
POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir custom_awsvault custom_kube vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

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
export KUBECONFIG=${HOME}/.kube/poc
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
# custom
##############################################################################
export CHAMBER_KMS_KEY_ALIAS="alias/terraform"

##############################################################################
# homebrew curl
##############################################################################
export PATH=/usr/local/opt/curl/bin:$PATH
