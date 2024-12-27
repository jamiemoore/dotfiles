# zmodload zsh/zprof
zmodload zsh/datetime

# Array to store timing data
typeset -A timing_data

function sourcey() {
    local start=$((EPOCHREALTIME*1000))
    source "$1"
    local end=$((EPOCHREALTIME*1000))
    timing_data[$1]=$((end-start))
}

sourcey ~/.zshrc.shell
sourcey ~/.zshrc.tmux
sourcey ~/.zshrc.brew
sourcey ~/.zshrc.pipx
sourcey ~/.zshrc.ack
# sourcey ~/.zshrc.android
sourcey ~/.zshrc.autojump
sourcey ~/.zshrc.azure
sourcey ~/.zshrc.certs
sourcey ~/.zshrc.curl
# sourcey ~/.zshrc.golang
sourcey ~/.zshrc.gpg
sourcey ~/.zshrc.helpers
sourcey ~/.zshrc.mise
sourcey ~/.zshrc.vim
sourcey ~/.zshrc.vault
sourcey ~/.zshrc.gpg
sourcey ~/.zshrc.kube
sourcey ~/.zshrc.colima
sourcey ~/.zshrc.typora
sourcey ~/.zshrc.prompt
[ -f ~/.zshrc.custom ] && sourcey ~/.zshrc.custom || true

# # Convert to array for sorting
# typeset -a timing_pairs
# for k v in ${(kv)timing_data}; do
#     timing_pairs+=("$k $v")
# done

# # Sort and print top 5
# print -l ${(On)timing_pairs} | head -n 5 | while read file timing; do
#     printf "Sourcing %-30s took %6.1f ms\n" $file $timing
# done

# Sort by timing and print top 5
print -l ${(k)timing_data} | sort -n -k2 -r -t' ' <(for k in ${(k)timing_data}; do echo "$k ${timing_data[$k]}"; done) | head -n 5 | while read file timing; do
    printf "Sourcing %-30s took %6.1f ms\n" "$file" "$timing"
done

# zprof