#!/usr/bin/env bash
[[ "$1" == "pkg-update" ]] && yay -Qe | awk '{print $1}' > packages.yay && exit

ln -sf $(pwd)/kitty ~/.config
ln -sf $(pwd)/nvim ~/.config
ln -sf $(pwd)/code '~/.config/Code - OSS'
ln -sf $(pwd)/zshrc ~/.zshrc
mkdir -p ~/.local/bin
cp $(pwd)/scripts/* ~/.local/bin

