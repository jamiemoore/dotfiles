##############################################################################
# Mise
##############################################################################
# cache_activate() {
#     local tool=$1 cache="$HOME/.cache/${tool}_activate.zsh"
#     [[ ! -f "$cache" || ~/.config/$tool -nt "$cache" || $(which $tool) -nt "$cache" ]] && $tool activate zsh > "$cache"
#     source "$cache"
# }

# cache_activate() {
#     local tool=$1 cache="$HOME/.cache/${tool}_activate.zsh"
#     mkdir -p "$(dirname "$cache")"  # Ensure cache dir exists
    
#     # Only regenerate if cache doesn't exist (simpler condition)
#     [[ ! -f "$cache" ]] && $tool activate zsh > "$cache"
#     source "$cache"
# }

# eval_with_cache mise activate zsh

eval "$(mise activate zsh)"
# zsh-defer eval "$(mise activate zsh)"


