# # Set up zinit
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# # Download Zinit if not present
# if [ ! -d "$ZINIT_HOME" ]; then
#    mkdir -p "$(dirname $ZINIT_HOME)"
#    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# fi

# # Load zinit
# source "${ZINIT_HOME}/zinit.zsh"

# # # Core zsh plugins
# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab

# # Plugin configuration
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'

# # Replay completions from plugins
# zinit cdreplay -q
