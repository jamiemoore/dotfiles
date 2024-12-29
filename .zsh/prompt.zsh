##############################################################################
# Prompt
##############################################################################
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'
setopt prompt_subst

virtualenv_info() {
    [ $VIRTUAL_ENV ] && echo " $(basename $VIRTUAL_ENV)"
}

proxy_info() {
    [ $https_proxy ] && echo " ${https_proxy}"
}

aws_info() {
    [ $AWS_PROFILE ] && echo " ${AWS_PROFILE}"
}

PROMPT='%1d%F{green}$(virtualenv_info)%f%F{blue}${vcs_info_msg_0_}%f%F{red}$(proxy_info)%f%F{yellow}$(aws_info)%f %# '

