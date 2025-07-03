##############################################################################
# colima
##############################################################################
# If colima is adding lines to your ssh file
# run colima template and set sshConfig: false

# Docker safe start function for Colima
docker_safe_start() {
    # Check if we're on macOS
    [[ "$(uname)" != "Darwin" ]] && return

    # Check if Colima is installed
    whence colima >/dev/null || {
        echo "Error: Colima is not installed. Please install it first:"
        echo "brew install colima"
        return 1
    }

    # Check Colima status
    if ! colima status 2>/dev/null; then
        echo "Colima is not running. Starting Colima..."
        colima start --ssh-config=false
    fi

    # Check Docker socket
    if [ ! -S "$HOME/.colima/default/docker.sock" ]; then
        echo "Error: Docker socket not found. There might be an issue with Colima setup"
        return 1
    fi

    export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
    return 0
}

# Set up the alias if we're on macOS
unset DOCKER_HOST
[[ "$(uname)" == "Darwin" ]] && alias docker='docker_safe_start && docker'
