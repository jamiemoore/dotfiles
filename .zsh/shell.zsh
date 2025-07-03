################################################################################
# shell
################################################################################

# remove duplicates from fpath
fpath=($(printf "%s\n" "${fpath[@]}" | awk '!seen[$0]++'))


# Autocomplete Settings
autoload -Uz compaudit
autoload -Uz compinit

#Fix permissions on any shared directories with other users
compaudit | xargs -r chmod g-w o-w

# only compile completions if the dump file is missing or older than 24 hours
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Load completions faster
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY       
# Share history between all sessions.
setopt SHARE_HISTORY
# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS
# Don't record an entry starting with a space.
setopt HIST_IGNORE_SPACE

# Cache fzf shell integration
if [[ ! -f ~/.cache/fzf.zsh ]] || [[ ! -s ~/.cache/fzf.zsh ]]; then
    mkdir -p ~/.cache
    fzf --zsh > ~/.cache/fzf.zsh
fi

# Fuzzy search history with ctrl-r and fuzzy file open with ctrl-t
source ~/.cache/fzf.zsh

# Return unmatched glob as glob
setopt nonomatch
# Remove % from lines without newline
unsetopt PROMPT_CR PROMPT_SP
# Don't display the highlighted % for partial line
PROMPT_EOL_MARK=
