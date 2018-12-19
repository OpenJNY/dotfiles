#!/bin/bash
# Script name : window-move-workspace.sh
# Author      : OpenJNY
# Date        : 2018-12-19
#
# Description:
#   This is a template file meant to be used for all my future
#
# Usage:
#   window-move-workspace.sh <window-name> <workspcace>

# Exit on error. Append '||true' when you run the script if you expect an error.
set -o errexit

# Exit on empty variable
# set -o nounset

# Debug mode
# set -x

SCRIPT_DIR=`pwd -P`
SCRIPT_NAME="$(basename "$0")"
LOGFILE=/dev/stderr

log() {
    echo "$(date +'%D %H:%M:%S:') $*" >> "$LOGFILE"
}

die() {
    log "$*"
    exit 1
}

usage() {
  echo <<UsageHeredoc
Usage: ${SCRIPT_NAME} [OPTIONS]

This is a default template for shell scripts.

Where valid OPTIONS are:
  -h, --help  display usage
UsageHeredoc
  
  exit 0
}

win_name="$1"
workspace="$2" # 0-origin
wait_found=false
to_fullscreen=false

([ -n "${win_name}" ] && [ -n "${workspace}" ]) || {
    die "Two arguments, <window name> and <workspace to move>, must be passed."
}

[[ $workspace =~ ^[0-9]+$ ]] || {
    die "Workspace number must be integer, but \"${workspace}\" was passed."
}

if $wait_found; then
    until wmctrl -l | grep -q "${win_name}"; do
        sleep 0.1
    done
fi

# Get the id of the specified window.
win_id=$(wmctrl -l | grep "${win_name}" | awk '{print $1}')
[ -n "${win_id}" ] || {
    die "No window named ${win_name} was found."
}

# Get the canonical window name.
canonical_win_name=$(wmctrl -l | grep "${win_id}" | sed 's/^[^ ]* *[^ ]* *[^ ]* //')

# Try to move the window to the specified workspace
wmctrl -i -r "${win_id}" -t "${workspace}" || {
    die "Couldn't move ${canonical_win_name} to workspace ${workspace}"
}

# If fullscreen option was set, make the moved window fullscreen. 
if to_fullscreen; then
    wmctrl -i -r "${win_id}" -b add,fullscreen # -b add,maximized_vert -b add,maximized_horz
fi

echo "Move \"${canonical_win_name}\" (id:${win_id}) to workspace ${workspace}"