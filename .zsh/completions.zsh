# Enable colours for ls (required for coloured completions)
eval "$(dircolors -b)"

# Core completion styling (before compinit)
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# local custom completions directory
fpath=("$HOME/.local/share/zsh/completions" $fpath)

# rm -f ~/.zcompdump* # may need to clear cache occasionally

# Load completion system
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit -C
