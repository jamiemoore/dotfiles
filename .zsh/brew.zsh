################################################################################
# Homebrew
################################################################################
export HOMEBREW=$(brew --prefix)
eval "$($HOMEBREW/bin/brew shellenv)"

export PATH="$HOMEBREW/opt/mysql-client/bin:$PATH"

fpath=($HOMEBREW/share/zsh-completions $fpath)