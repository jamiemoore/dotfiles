################################################################################
# shell
################################################################################
typeset -U fpath

# Enable vi mode
bindkey -v

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
# Return unmatched glob as glob
setopt nonomatch
# Remove % from lines without newline
unsetopt PROMPT_CR PROMPT_SP
# Don't display the highlighted % for partial line
PROMPT_EOL_MARK=
#Disable bracketed paste mode
unset zle_bracketed_paste

# # Reduce key delay (makes mode switching faster)
# export KEYTIMEOUT=1

# Fix some common keys that break in vi mode
bindkey '^A' beginning-of-line                    # Ctrl+A to beginning
bindkey '^E' end-of-line                          # Ctrl+E to end
# bindkey '^K' kill-line                            # Ctrl+K to kill line
# bindkey '^U' kill-whole-line                      # Ctrl+U to kill whole line
# bindkey '^W' backward-kill-word                   # Ctrl+W to kill word
# bindkey '^Y' yank  

# Load complist for menu selection
zmodload zsh/complist

# Vim-style navigation in completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history  
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Make sure the completions directory exists
if [ ! -d "$HOME/.local/share/zsh/completions" ]; then
  mkdir -p "$HOME/.local/share/zsh/completions"
fi
