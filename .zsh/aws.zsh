# Switch AWS profiles
function aws_profiles_ls() {
    export AWS_PROFILE=$(cat ~/.aws/config | grep -E '^\[profile' | cut -d ' ' -f 2 | sed 's/.$//' |grep -v -E '^default$' | fzf)
}

function aws_ec2_ls() {
     aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" | jq -r '.Reservations[].Instances[] | [.InstanceId, .InstanceType, (.Tags[] | select(.Key=="Name") | .Value // "No Name Tag")] | @tsv' | fzf | cut -f 1
}

bindkey -s '^P' 'aws_profiles_ls\n'
bindkey -s '^O' 'aws_ec2_ls\n'

# AWS completions (add this here)
complete -C 'aws_completer' aws
