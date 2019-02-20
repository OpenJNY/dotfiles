
# Change Directory
# ----------------

# git でインストールした fzf の読み込み
[[ -f "~/.fzf" && -f "~/.fzf.zsh" ]] && source ~/.fzf.zsh

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
