
# zsh のディレクトリの変更時に chpwd 関数が呼ばれる仕様を利用して
# 自動で vertualenv をアクティベートする
function chpwd_pyvenv() {
    if [ -d .venv ]; then
        source .venv/bin/activate
    elif [ -d venv ]; then
        source venv/bin/activate
    fi
}

chpwd_pyvenv # for initialization
add-zsh-hook chpwd chpwd_pyvenv

# alias venv='source venv/bin/activate'