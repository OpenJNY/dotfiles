# Update pip package
function pip-update-all() {
    echo "which pip: $(which pip)"
    echo "pip list --outdated --format=columns | awk '{if (NR>2) print $1}' | xargs pip install -U"
    pip list --outdated --format=columns | awk '{if (NR>2) print $1}' | xargs pip install -U
}

# zsh のディレクトリの変更時に chpwd 関数が呼ばれる仕様を利用して
# 自動で vertualenv をアクティベートする
function auto_activate_venv() {
    if [ -d .venv ]; then
        source .venv/bin/activate
    elif [ -d venv ]; then
        source venv/bin/activate
    fi
}

auto_activate_venv # for initialization
add-zsh-hook chpwd auto_activate_venv

# alias venv='source venv/bin/activate'

# Jupyter Notebook
alias jupyter-notebook-silent='jupyter notebook --no-browser'

# Pipenv
# ------

export PIPENV_VENV_IN_PROJECT=1

# Anaconda
# --------
export CONDA_ROOT='$HOME/.pyenv/versionis/miniconda3-latest'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(conda 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_ROOT/etc/profile.d/conda.sh" ]; then
        . "$CONDA_ROOT/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_ROOT/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


if which conda >/dev/null; then
  # source $(conda info --root)/etc/profile.d/conda.sh

  alias cona='conda activate'
  alias cond='conda deactivate'
  alias conl='conda env list'
fi

