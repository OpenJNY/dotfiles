#!/bin/bash

set -Cu

create_symlink() {
  if [ ! -e "$1" ]; then
    echo "リンク先が存在しません: $1"
  elif [ -e "$2" ]; then
    echo "同名のファイルが既に存在します: $2"
  else
    ln -s "$1" "$2"
    echo "シンボリックリンクを作成しました: $2 -> $1"
  fi
}

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
  create_symlink $HOME/dotfiles/$file $HOME/$file
done
