##############################################################################
# aws-vault
##############################################################################
if [[ ! -f ~/.cache/aws-vault-completions.zsh ]] || [[ ! -s ~/.cache/aws-vault-completions.zsh ]]; then
    mkdir -p ~/.cache
    aws-vault --completion-script-zsh > ~/.cache/aws-vault-completions.zsh
fi

source ~/.cache/aws-vault-completions.zsh

export AWS_VAULT_KEYCHAIN_NAME=aws-vault
# export AWS_VAULT_PROMPT=osascript
export AWS_ASSUME_ROLE_TTL=1h
export AWS_SESSION_TTL=12h
export AWS_FEDERATION_TOKEN_TTL=12h

# Vault Aliases

# alias awp="aws-vault exec prod-admin -- aws"
# alias awn="aws-vault exec nonprod-admin -- aws"
# alias vap="aws-vault exec prod-admin -- "
# alias van="aws-vault exec nonprod-admin -- "