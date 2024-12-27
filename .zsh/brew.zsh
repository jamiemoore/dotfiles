################################################################################
# Homebrew
################################################################################

# Cache the Homebrew prefix
if [[ ! -f ~/.cache/brew_prefix ]]; then
    mkdir -p ~/.cache
    brew --prefix > ~/.cache/brew_prefix
fi
readonly HOMEBREW=$(<~/.cache/brew_prefix)

# Cache brew shellenv output
if [[ ! -f ~/.cache/brew_shellenv ]] || [[ ! -s ~/.cache/brew_shellenv ]]; then
    mkdir -p ~/.cache
    $HOMEBREW/bin/brew shellenv > ~/.cache/brew_shellenv
fi

source ~/.cache/brew_shellenv

export PATH="$HOMEBREW/opt/mysql-client/bin:$PATH"

fpath=($HOMEBREW/share/zsh-completions $fpath)