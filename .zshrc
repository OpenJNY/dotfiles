if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

# Location setting
# ----------------

# function vim {
#   env VIRTUAL_ENV=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"` /usr/bin/vim "$@"
# }

function setlang_jp() {
  export LANG=ja_JP.UTF-8
  export LANGUAGE=ja_JP.ja
  export LC_ALL=ja_JP.UTF-8
}

function setlang_en() {
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US:en
  export LC_ALL=en_US.UTF-8
}

lang=$(locale -a 2> /dev/null | grep -E "(ja_JP.UTF-8|ja_JP.utf8)")
if [ $? -eq 0 ]; then
  export LANG=${lang}
  export LC_ALL="${lang}"
else
  # There was no japanese locale; thus set english location."
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US:en
  export LC_ALL=en_US.UTF-8
fi

export EDITOR=vim

# zplug settings:
# --------------

# export ZPLUG_HOME=/usr/local/opt/zplug
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"
zplug "esc/conda-zsh-completion"

# compinit 以降に読み込むようにロードの優先度を変更する
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3

# If this module is used in conjuncture with the syntax-highlighting module, it must be loaded after it.
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# This ZSH plugin enhances the terminal environment with 256 colors.
zplug "chrissicool/zsh-256color"

# clipboard/pbcopy, clippaste/pbpaste の違いを吸収（clip*に統一）
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
#zplug "modules/osx", from:prezto, if:"[[ $OSTYPE == *darwin* ]]"

zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/docker",            from:oh-my-zsh
zplug "plugins/docker-compose",    from:oh-my-zsh
zplug "plugins/common-aliases",    from:oh-my-zsh

zplug "modules/editor", from:prezto
zstyle ':prezto:module:editor' key-bindings 'vim'
bindkey -v

# prompt
# ------
# zstyle は zplug load の前に設定する
zplug "modules/prompt", from:prezto
zstyle ':prezto:module:prompt' theme 'pure'

# インタラクティブフィルタ
#zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
#zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# if ! zplug check; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

zplug load

# zsh settings:
# -----------------------

autoload colors
colors

# setopt auto_list             # 補完候補が複数ある時に、一覧表示
# setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
# setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
# setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
# setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
# setopt auto_param_keys       # カッコの対応などを自動的に補完
# setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
#
# setopt complete_in_word      # 語の途中でもカーソル位置で補完
# setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
#
# setopt print_eight_bit
# setopt extended_glob
# setopt globdots
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes


# coreutils, findutils
case "${OSTYPE}" in
darwin*)
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export PATH=/usr/local/opt/findutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
  export MANPATH=/usr/local/opt/findutils/libexec/gnuman:${MANPATH}

  # Visual Studio Code
  function vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* }
  ;;
linux*)
  ;;
esac

#---------------------------------------------------------------------------
# Env
#---------------------------------------------------------------------------

# pyenv
# -----
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # alias for activate/deactivate command.
    if [ -d "$PYENV_ROOT/versions/miniconda3-latest" ]; then
      alias activate="source $PYENV_ROOT/versions/miniconda3-latest/bin/activate"
      alias deactivate="source $PYENV_ROOT/versions/miniconda3-latest/bin/deactivate"
    fi
fi

# CUDA
# ----
export CUDA_ROOT="/usr/local/cuda"
if [ -d "${CUDA_ROOT}" ]; then
  export PATH="${CUDA_ROOT}/bin:${PATH}"
  export LD_LIBRARY_PATH="${CUDA_ROOT}/extras/CUPTI/lib64:${CUDA_ROOT}/lib64:${CUDA_ROOT}/lib:${LD_LIBRARY_PATH}"
  export CPATH="${CUDA_ROOT}/include:${CPATH}"
fi

# Nodebrew
# --------
if [ -d "$HOME/.nodebrew" ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# Julia
# -----
export JULIA_ROOT="/Applications/Julia-0.6.app/Contents/Resources/julia"
if [ -d "${JULIA_ROOT}" ]; then
  export PATH="${JULIA_ROOT}/bin:$PATH"
fi

eval "$(plenv init -)"


#---------------------------------------------------------------------------
# Alias
#---------------------------------------------------------------------------

alias ls="ls --color=auto -G"
alias ll='ls -ltr'
alias la="ls -lhAF --color=auto"

alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# History
# -------

# 参考: prezto/modlue/hitory

# 履歴の保存ファイル，保存件数（メモリ，ファイル）
export HISTFILE="${HOME}/.zhistory"
export HISTSIZE=10000
export SAVEHIST=100000

# 履歴をすべてのセッションで共有する
setopt share_history
# コマンド実行時間も履歴に追加
setopt extended_history
# 重複を記録しない
setopt hist_ignore_dups
# 重複があれば古い履歴を削除
setopt hist_ignore_all_dups
# 保存時にもダブりがないように
setopt hist_save_no_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
# 履歴を展開してもすぐには実行しない
setopt hist_verify


function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  # zle accept-line # 現在行に書かれてあるコマンドを実行する
  # zle clear-screen # 画面をクリア（一番上に現在行が来るようにシフト）
}

zle -N select-history
bindkey '^r' select-history

# Git
# ---

function checkout() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}


# Change Directory
# ----------------

function fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# ファイルかディレクトリの名前の一部を渡すと，適当な深さまで調べて移動するコマンド
function fzf-find-file-cd() {
  local FILENAME="$1"
  local MAXDEPTH="${2:-4}"
  local BASE_DIR="${3:-`pwd`}"
  if [ -z "$FILENAME" ] ; then
    echo "Usage: fzf-find-file-cd <filename> [<maxdepth=4> [<basedir='.']]"
    return 1
  fi
  local dir=$(find ${BASE_DIR} -maxdepth ${MAXDEPTH} -name "*${FILENAME}*" | fzf +m)
  if [ ! -d ${dir} ]; then
    dir=${dir%/*}
  fi
  echo cd "$dir"
  cd "$dir"
}

alias findcd=fzf-find-file-cd

# 指定した場所より下位層にあるすべてのディレクトリ (隠しディレクトリ以外) を表示して，
# 選んだディレクトリに飛ぶ
function fzf-find-dirs-cd() {
  local dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
  echo cd "$dir" &&
  cd "$dir"
}
alias fd=fzf-find-dirs-cd

# fkill - kill process
function fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

for zshconf in ~/.zsh/*.zsh; do
  source $zshconf
done

