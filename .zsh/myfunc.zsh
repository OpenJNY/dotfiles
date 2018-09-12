function latest-file-in () {
  local dir=$1
  #local file=$(find $dir -maxdepth 1 -type f \( -iname "*" ! -name ".*" \) -printf "%T@ %p\n" | sort -nr | awk 'NR==1 {print $2}')
  local file=$(find $dir -maxdepth 1 -type f -print0 | xargs -0 ls -drt | tail -n 1)
  file=$(printf '%q' "$file") #for escape
  echo $file
}

function latest-file-in-desktop () {
  echo $(latest-file-in ~/Desktop)
}


function latest-file-in-downloads () {
  echo $(latest-file-in ~/Downloads)
}

function mv-download-file () {
  local output="."
  if [ $1 ]; then
    output=$1
  fi
  
  local input=$(latest-file-in-downloads)
  echo -n "mv: move from '$input' to '$output'? (Y/n) "
  read
  if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
    mv "$input" $output
  fi
}

alias oldesk='open $(latest-file-in-desktop)'
alias oldown='open $(latest-file-in-downloads)'

