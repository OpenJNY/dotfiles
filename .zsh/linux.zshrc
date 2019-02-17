
alias open='xdg-open &>/dev/null'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# make CapsLock behave like Ctrl:
# setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
# xcape -e 'Control_L=Escape'
# if [ -f "$HOME/.Xmodmap" ]; then
#     setxkbmap -option
#     xmodmap $HOME/.Xmodmap
#     xcape -e 'Mode_switch=Escape'
#     echo "Enable xmodmap" > /tmp/xmodmap.log
# fi

set_keyboard_setting() {
    setxkbmap -option
    xmodmap $HOME/.Xmodmap
    xcape -e 'Mode_switch=Escape'
}