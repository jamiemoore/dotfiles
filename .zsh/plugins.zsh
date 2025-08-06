PLUGIN_DIR="$HOME/.local/share/zsh/plugins"
PLUGIN_LOCK="$PLUGIN_DIR/.plugins.lock"
[ -d "$PLUGIN_DIR" ] || mkdir -p "$PLUGIN_DIR"

# Reinstall function
update-plugins() {
  rm -fr "$PLUGIN_DIR"
  echo "Plugin lock removed. Restart your shell to reinstall plugins."
}

# Define plugins: "github_repo name"
plugins=(
  "romkatv/zsh-defer"
  "zsh-users/zsh-syntax-highlighting"
  "marlonrichert/zsh-autocomplete"
  "zsh-users/zsh-autosuggestions"
  "Aloxaf/fzf-tab"
)

# Only install plugins if lock file doesn't exist
if [ ! -f "$PLUGIN_LOCK" ]; then
  for plugin in "${plugins[@]}"; do
    plugin_name=${plugin##*/}
    if [ ! -d "$PLUGIN_DIR/$plugin_name" ]; then
      git clone --quiet "https://github.com/$plugin" "$PLUGIN_DIR/$plugin_name" --depth=1
    fi
  done
  date > "$PLUGIN_LOCK"
fi

# Source plugins
source "$PLUGIN_DIR/zsh-defer/zsh-defer.plugin.zsh"

source "$PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$PLUGIN_DIR/fzf-tab/fzf-tab.zsh"
# This is handy but slows down shell startup 
source "$PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
# This plugin is too slow, but cool.
# source "$PLUGIN_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# time (source "$PLUGIN_DIR/zsh-defer/zsh-defer.plugin.zsh")
# time (source "$PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh")
# time (source "$PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh")
# time (source "$PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh")
# time (source "$PLUGIN_DIR/fzf-tab/fzf-tab.zsh")

# Plugin configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Used with fzf-tab
zstyle ':completion:*' menu no select
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
