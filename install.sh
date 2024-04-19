#!/bin/bash

DOTFILES=".zshrc .tmux.conf .vimrc .config/alacritty.toml"

# Create bin directory
mkdir -p "$HOME/.local/bin"

# Symlink dotfiles
for file in $DOTFILES; do
    ln -sf $PWD/$file $HOME/$file
done
