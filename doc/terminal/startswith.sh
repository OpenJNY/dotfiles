#!/bin/bash

set -e

startswith() { case $2 in "$1"*) true;; *) false;; esac; }

# Unit Test
# ---------

T="True"
F="False"

testcase() {
  prefix="$1"
  test_str="$2"
  expected="$3" # specifies $T or $F

  echo -n "[test] 'startswith $prefix $test_str' returns "
  if startswith $prefix $test_str; then
    ret="$T"
  else
    ret="$F"
  fi
  echo "$ret"

  if [ "$ret" = "$expected" ]; then
    echo "ok!"
  else
    echo "ERROR"
    exit 1
  fi
}

testcase "prefix" "prefix_test" $T
testcase "prefix" "pre_test" $F
testcase "~/dotfiles" "~/dotfiles/.gitignore_global" $T