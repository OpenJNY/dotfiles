
# Visual Studio Code
function vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* }

# colored less command
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS='-R'
# export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'

# https://github.com/mnarrell/dotfiles/blob/70d86468db7145b37580a6ae4964fc994899048d/gnu/env.zsh 
local -a gnu_paths
gnu_path=(
  "/usr/local/opt/coreutils/libexec/gnubin"
  "/usr/local/opt/findutils/libexec/gnubin"
  "/usr/local/opt/grep/libexec/gnubin"
  "/usr/local/opt/gnu-getopt/bin"
  "/usr/local/opt/gnu-tar/libexec/gnubin"
  "/usr/local/opt/gnu-which/libexec/gnubin"
  "/usr/local/opt/make/libexec/gnubin"
  "/usr/local/opt/less/bin"
  "/usr/local/opt/gnu-sed/libexec/gnubin"
)

local -a gnu_manpath
gnu_manpath=(
  "/usr/local/opt/coreutils/libexec/gnuman"
  "/usr/local/opt/findutils/libexec/gnuman"
  "/usr/local/opt/grep/libexec/gnuman"
  "/usr/local/opt/gnu-which/libexec/gnuman"
  "/usr/local/opt/gnu-tar/libexec/gnuman"
  "/usr/local/opt/make/libexec/gnuman"
  "/usr/local/opt/gnu-sed/libexec/gnuman"
)

GNU_PATH=${(j.:.)gnu_path}
GNU_MANPATH=${(j.:.)gnu_manpath}

export PATH="${GNU_PATH}:$PATH"
export MANPATH="${GNU_MANPATH}:$MANPATH"


function add-path-if-exists() {
  local BINDIR="$1"
  if [ -d "$BINDIR" ]; then
    export PATH="${BINDIR}:${PATH}"
  fi
}

add-path-if-exists "/usr/local/opt/unzip/bin"
