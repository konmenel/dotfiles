#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

# fish
ln -s ${BASEDIR}/config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/.config/fish/config.fish ~/.fishrc

# VSCode
ln -s ${BASEDIR}/config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -s ${BASEDIR}/config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
