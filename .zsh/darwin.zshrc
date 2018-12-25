
# Visual Studio Code
function vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* }

# colored less command
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS='-R'
# export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'