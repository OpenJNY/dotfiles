
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# ag (the silver searcher)
# ------------------------
alias ag='ag -S --stats --pager "less -F"'
alias agh='ag --hidden'

# Git
# ---

function checkout() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# ghs
# 
# $ sudo npm i -g gh-search-cli

function search-github-commit-msg() {
  ghs commits "$*" -j > /tmp/ghs.log.json
  cat /tmp/ghs.log.json | jq -r '.[].commit.message' 
  echo "[search_commit_msg] The log file were saved at /tmp/ghs.log.json"
}

alias ghs-commits='search-github-commit-msg'