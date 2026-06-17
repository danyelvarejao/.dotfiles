#!/usr/bin/env bash

BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

backup() {
    local path="$1"

    if [ -e "$path" ] || [ -L "$path" ]; then
        echo "Backing up: $path"
        mkdir -p "$BACKUP_DIR$(dirname "${path#$HOME}")"
        mv "$path" "$BACKUP_DIR${path#$HOME}"
    fi
}

# Omarchy defaults
backup "$HOME/.local/share/omarchy/bin/omarchy-capture-screenrecording"
backup "$HOME/.config/environment.d/fcitx.conf"

# Dotfiles
backup "$HOME/.zshrc"
backup "$HOME/.zshenv"
backup "$HOME/.ideavimrc"
backup "$HOME/.vimrc"
backup "$HOME/.XCompose"

backup "$HOME/.config/alacritty"
backup "$HOME/.config/ashell"
backup "$HOME/.config/btop/btop.conf"
backup "$HOME/.config/git"
backup "$HOME/.config/hypr"
backup "$HOME/.config/lazygit"
backup "$HOME/.config/nvim"
backup "$HOME/.config/starship.toml"
backup "$HOME/.config/uwsm"
backup "$HOME/.config/walker"
backup "$HOME/.config/waybar"
backup "$HOME/.config/mimeapps.list"

echo "Backup salvo em: $BACKUP_DIR"

# Stow
for pkg in \
    alacritty \
    ashell \
    btop \
    environment \
    git \
    hypr \
    jetbrains \
    lazygit \
    nvim \
    scripts \
    starship \
    uwsm \
    walker \
    waybar \
    zsh
do
    echo "Stowing $pkg..."
    stow "$pkg"
done

echo "Concluído."
