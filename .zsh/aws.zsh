
function apro() {
    export AWS_PROFILE=$(cat ~/.aws/config | grep -E '^\[profile' | cut -d ' ' -f 2 | sed 's/.$//' |grep -v -E '^default$' | fzf)
}
