################################################################################
# Homebrew
################################################################################

# If running on Linux, return early
[[ "$OSTYPE" == "linux"* ]] && return

#Set the path only if the directory exists as brew may be in /usr/local/bin
if [[ -d /opt/homebrew/bin ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Cache the Homebrew prefix
if [[ ! -f ~/.cache/brew_prefix ]]; then
    mkdir -p ~/.cache
    brew --prefix > ~/.cache/brew_prefix
fi
export HOMEBREW=$(<~/.cache/brew_prefix)

# Cache brew shellenv output
if [[ ! -f ~/.cache/brew_shellenv ]] || [[ ! -s ~/.cache/brew_shellenv ]]; then
    mkdir -p ~/.cache
    $HOMEBREW/bin/brew shellenv > ~/.cache/brew_shellenv
fi

source ~/.cache/brew_shellenv

export PATH="$HOMEBREW/opt/mysql-client/bin:$PATH"

fpath=($HOMEBREW/share/zsh-completions $fpath)

# curl
export PATH="$HOMEBREW/opt/curl/bin:$PATH"
