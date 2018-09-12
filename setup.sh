#!/bin/bash

DOT_FILES=(
    .bash_profile
    .agignore
    .gitconfig
    .gitignore_global
    .latexmkrc
    .tmux.conf
    .tmux.darwin.conf
    .vimrc
    .vim
    .zshrc
    .zsh
)

for file in ${DOT_FILES[@]}; do
    if [ -e "$HOME/$file" ]; then
        echo "Skip over '$file', because '$HOME/$file' already exists."
    else
        ln -sv $HOME/dotfiles/$file $HOME/$file
    fi
done
