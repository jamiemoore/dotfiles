################################################################################
# helpers
################################################################################
# # When you really can't remember the name of a command
# netstat () {lsof -nP -iTCP | grep LISTEN}

# # UTC date time converters
# udate () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d %H:%M:%S" }
# us3date () { gdate -u --date=@$(gdate +%s --date="$*") "+%Y-%m-%d:%H:%M:%S" }

# cache_activate() {
#     local tool=$1 cache="$HOME/.cache/${1}_activate.zsh"
#     [[ ! -f "$cache" ]] && $tool activate zsh > "$cache" 2>/dev/null
#     source "$cache"
# }


# eval_with_cache() {
#     local cache="$HOME/.cache/$(printf '%s' "$*" | tr ' /' '_-').zsh"
#     # echo "Local cache command: $local"
#     [[ ! -f "$cache" ]] && { mkdir -p ~/.cache; "$@" > "$cache"; }
#     # echo "Sourcing $cache"
#     # echo "Word count: $(wc -l < "$cache")"
#     source "$cache"
# }
