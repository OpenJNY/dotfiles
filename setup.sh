#!/bin/bash

set -Cu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

create_symlink() {
  if [ ! -e "$1" ]; then
    echo "リンク先が存在しません: $1"
  elif [ -e "$2" ]; then
    echo "同名のファイルが既に存在します: $2"
  else
    ln -s "$1" "$2"
    echo "シンボリックリンクを作成しました: $2 (実体：$1)"
  fi
}

DOT_FILES=(
  bin
  .agignore
  .dircolors
  .gitconfig
  .gitignore_global
  .latexmkrc
  .tmux.conf
  .tmux.darwin.conf
  .vimrc
  .vim
  .zshenv
  .zsh
  .Xmodmap
)

for dotfile in ${DOT_FILES[@]}; do
  create_symlink $SCRIPT_DIR/$dotfile $HOME/$dotfile
done
