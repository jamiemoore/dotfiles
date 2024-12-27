# zmodload zsh/zprof
zmodload zsh/datetime

readonly SHOW_TIMING=false
readonly SHOW_TIMING_THRESHOLD=5

# Array to store timing data
typeset -A timing_data

# Function to source a file and store the time it took to source it
function sourcey() {
    local start=$((EPOCHREALTIME*1000))
    source "$1"
    local end=$((EPOCHREALTIME*1000))
    timing_data[$1]=$((end-start))
}

sourcey ~/.zsh/shell.zsh
sourcey ~/.zsh/tmux.zsh
sourcey ~/.zsh/brew.zsh
sourcey ~/.zsh/pipx.zsh
sourcey ~/.zsh/ack.zsh
# sourcey ~/.zsh/android.zsh
sourcey ~/.zsh/autojump.zsh
sourcey ~/.zsh/azure.zsh
sourcey ~/.zsh/certs.zsh
sourcey ~/.zsh/curl.zsh
# sourcey ~/.zsh/golang.zsh
sourcey ~/.zsh/gpg.zsh
sourcey ~/.zsh/helpers.zsh
sourcey ~/.zsh/mise.zsh
sourcey ~/.zsh/vault.zsh
sourcey ~/.zsh/kube.zsh
sourcey ~/.zsh/colima.zsh
sourcey ~/.zsh/typora.zsh
sourcey ~/.zsh/prompt.zsh
sourcey ~/.zsh/editor.zsh

[ -f ~/.local.zsh ] && sourcey ~/.local.zsh || true

if [[ "$SHOW_TIMING" == "true" ]]; then
    print -l ${(k)timing_data} | \
        sort -n -k2 -r -t' ' <(for k in ${(k)timing_data}; do echo "$k ${timing_data[$k]}"; done) | \
        head -n $SHOW_TIMING_THRESHOLD | \
        while read file timing; do
            printf "%-20s %6.1f ms\n" "${file:t}" "$timing"
        done
fi

# zprof