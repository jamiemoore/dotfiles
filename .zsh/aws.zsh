# Switch AWS profiles

function aws_profiles_ls() {
    export AWS_PROFILE=$(awk '/^\[profile / && !/default/ {gsub(/\]/, "", $2); print $2}' ~/.aws/config | fzf)
}
aws_profiles_widget() {
    zle push-line
    zle clear-screen
    aws_profiles_ls
    zle reset-prompt
}

zle -N aws_profiles_widget
bindkey '^P' aws_profiles_widget

# List running EC2 instances and select one
function aws_ec2_ls() {
     aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" | jq -r '.Reservations[].Instances[] | [.InstanceId, .InstanceType, (.Tags[] | select(.Key=="Name") | .Value // "No Name Tag")] | @tsv' | fzf | cut -f 1
}

bindkey -s '^O' 'aws_ec2_ls\n'

# AWS completions (add this here)
complete -C 'aws_completer' aws
