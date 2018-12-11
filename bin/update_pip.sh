#!/bin/bash

set -e

yellow=33

function colored() {
  color=$1
  shift
  echo -e "\033[1;${color}m$@\033[0m"
}

echo $(colored "$yellow;1" "pip list --outdated --format=columns | awk '{if (NR>2) print \$1}' | xargs pip install -U")
pip list --outdated --format=columns | awk '{if (NR>2) print $1}' | xargs pip install -U

if [ $? -ne 0 ]; then
  exit 1
fi