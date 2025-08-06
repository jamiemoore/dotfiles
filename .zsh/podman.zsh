if [ ! -f "$HOME/.local/share/zsh/completions/_podman" ]; then
    podman completion zsh > ~/.local/share/zsh/completions/_podman
fi
