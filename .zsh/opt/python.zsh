# Update pip package
function pip-update-all() {
    echo "which pip: $(which pip)"
    echo "pip list --outdated --format=columns | awk '{if (NR>2) print $1}' | xargs pip install -U"
    pip list --outdated --format=columns | awk '{if (NR>2) print $1}' | xargs pip install -U
}

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

# Jupyter Notebook
alias jupyter-notebook-silent='jupyter notebook --no-browser'