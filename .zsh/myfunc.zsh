function latest-file-in () {
  local dir=$1
  local file=$(find $dir -maxdepth 1 -type f \( -iname "*" ! -name ".*" \) -printf "%T@ %p\n" | sort -nr | awk 'NR==1 {print $2}')
  echo $file
}

function latest-file-in-desktop () {
  echo $(latest-file-in ~/Desktop)
}


function latest-file-in-downloads () {
  echo $(latest-file-in ~/Downloads)
}

alias oldesk='open $(latest-file-in-desktop)'
alias oldown='open $(latest-file-in-downloads)'
