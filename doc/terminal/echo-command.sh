
red=31
yellow=33
cyan=36
while=37

colored() {
  color=$1
  shift
  echo -e "\033[1;${color}m$@\033[0m"
}

run_colored() {
  echo $(colored "$yellow;1" "\$ $@")
  
  "$@"
  result=$?

  if [ $result -ne 0 ]; then
    echo -n $(colored $red "Failed: ")
    echo -n $(colored $cyan "$@")
    echo $(colored $yellow " [$PWD]")
    exit $result
  fi

  echo ""
  return 0
}

run() {
  echo "\$ ${@}"
  "$@"
  result=$?

  if [ $result -ne 0 ]; then
    color=31 #red
    errmsg="Failed with error code ${result}"
    echo -e "\033[1;${color}m${errmsg}\033[0m"
    exit $result
  fi

  return 0
}