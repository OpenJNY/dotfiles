#!/bin/bash

set -e

red=31
yellow=33
cyan=36
while=37

function colored() {
  color=$1
  shift
  echo -e "\033[1;${color}m$@\033[0m"
}

function run() {
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

run brew update
run brew upgrade --all
run brew cleanup