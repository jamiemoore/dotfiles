
# zmodload zsh/zprof

zd=$HOME/.zsh

source "$zd/shell.zsh"
source "$zd/plugins.zsh"
source "$zd/helpers.zsh"
source "$zd/brew.zsh"
source "$zd/ssh.zsh"
source "$zd/aliases.zsh"
source "$zd/colima.zsh"
source "$zd/editor.zsh"
source "$zd/prompt.zsh"
source "$zd/podman.zsh"
source "$zd/completions.zsh"
source "$zd/aws.zsh" # must be after completions.zsh
zsh-defer source "$zd/zoxide.zsh"
zsh-defer source "$zd/mise.zsh"
zsh-defer source "$zd/fzf.zsh"
source "$zd/tmux.zsh"

# zprof

# time (source "$zd/shell.zsh")
# time (source "$zd/plugins.zsh")
# time (source "$zd/helpers.zsh")
# time (source "$zd/brew.zsh")
# time (socurce "$zd/ssh.zsh")
# time (source "$zd/aws.zsh")
# time (source "$zd/aliases.zsh")
# time (source "$zd/colima.zsh")
# time (source "$zd/prompt.zsh")
# time (source "$zd/editor.zsh")
# time (source "$zd/completions.zsh")
# time (source "$zd/zoxide.zsh")
# time (source "$zd/mise.zsh")
# time (source "$zd/fzf.zsh")
# time (source "$zd/tmux.zsh")


# zsh-defer source ~/.zsh/fzf-defer.zsh
# zsh-defer source ~/.zsh/mise.zsh

# # zmodload zsh/zprof
# zmodload zsh/datetime

# if ! readonly | grep -q SHOW_TIMING; then
#     readonly SHOW_TIMING=true
#     readonly SHOW_TIMING_THRESHOLD=25
# fi

# # Array to store timing data
# typeset -A timing_data

# # Function to source a file and store the time it took to source it
# function sourcey() {
#     local start=$((EPOCHREALTIME*1000))
#     source "$1"
#     local end=$((EPOCHREALTIME*1000))
#     timing_data[$1]=$((end-start))
# }

# sourcey ~/.zsh/shell.zsh # first
# sourcey ~/.zsh/plugins.zsh
# sourcey ~/.zsh/helpers.zsh
# sourcey ~/.zsh/brew.zsh
# sourcey ~/.zsh/ssh.zsh
# # sourcey ~/.zsh/pipx.zsh
# sourcey ~/.zsh/aws.zsh
# sourcey ~/.zsh/aliases.zsh
# # sourcey ~/.zsh/android.zsh
# # sourcey ~/.zsh/autojump.zsh
# # sourcey ~/.zsh/azure.zsh
# # sourcey ~/.zsh/certs.zsh
# # sourcey ~/.zsh/golang.zsh
# # sourcey ~/.zsh/gpg.zsh
# # sourcey ~/.zsh/mise.zsh
# # sourcey ~/.zsh/nvm.zsh
# # sourcey ~/.zsh/vault.zsh
# # sourcey ~/.zsh/kube.zsh
# sourcey ~/.zsh/colima.zsh
# sourcey ~/.zsh/prompt.zsh
# sourcey ~/.zsh/editor.zsh
# sourcey ~/.zsh/completion.zsh
# # sourcey ~/.zsh/fzf.zsh
# sourcey ~/.zsh/zoxide.zsh
# sourcey ~/.zsh/zinit.zsh
# sourcey ~/.zsh/tmux.zsh # must be last

# [ -f ~/.local.zsh ] && sourcey ~/.local.zsh || true
# [ -f ~/.zshrc.custom ] && sourcey ~/.zshrc.custom || true

# zsh-defer source ~/.zsh/fzf-defer.zsh
# zsh-defer source ~/.zsh/mise.zsh

# # if [[ "$SHOW_TIMING" == "true" ]]; then
# #     print -l ${(k)timing_data} | \
# #         sort -n -k2 -r -t' ' <(for k in ${(k)timing_data}; do echo "$k ${timing_data[$k]}"; done) | \
# #         head -n $SHOW_TIMING_THRESHOLD | \
# #         while read file timing; do
# #             printf "%-20s %6.1f ms\n" "${file:t}" "$timing"
# #         done
# # fi

# # zprof
