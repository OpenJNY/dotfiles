# .zshenv
# 環境変数の設定を行う

case "${OSTYPE}" in
  darwin*)
    if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
      export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
      export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    fi

    if [ -d "/usr/local/opt/findutils/libexec/gnubin" ]; then
      export PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"
      export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
    fi

    JULIA_ROOT="/Applications/Julia-0.6.app/Contents/Resources/julia"
    PYENV_ROOT="$HOME/.pyenv"
    NODEBREW_ROOT="$HOME/.nodebrew"
    ;;
  linux*)
    CUDA_ROOT="/usr/local/cuda"
    PYENV_ROOT="$HOME/.pyenv"
    NODEBREW_ROOT="$HOME/.nodebrew"
    ;;
esac

function setlang() {
  lang=$(locale -a 2> /dev/null | grep -E "(ja_JP.UTF-8|ja_JP.utf8)")
  if [ $? -eq 0 ]; then
    export LANG=${lang}
    export LANGUAGE=ja_JP.ja
    export LC_ALL="${lang}"
  else
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US:en
    export LC_ALL=en_US.UTF-8
  fi
}

export EDITOR=vim

# ---------------
# SOMETHING_ROOT をこれより前に書いておくと SOMETHING をいい感じに読み込む
# ---------------

# Pyenv
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:$PATH"
  eval "$(pyenv init -)"

  # alias for activate/deactivate command.
  if [ -d "$PYENV_ROOT/versions/miniconda3-latest" ]; then
    alias activate="source $PYENV_ROOT/versions/miniconda3-latest/bin/activate"
    alias deactivate="source $PYENV_ROOT/versions/miniconda3-latest/bin/deactivate"
  fi
fi

# CUDA
if [ -d "${CUDA_ROOT}" ]; then
  export CUDA_ROOT
  export PATH="${CUDA_ROOT}/bin:${PATH}"
  export LD_LIBRARY_PATH="${CUDA_ROOT}/extras/CUPTI/lib64:${CUDA_ROOT}/lib64:${CUDA_ROOT}/lib:${LD_LIBRARY_PATH}"
  export CPATH="${CUDA_ROOT}/include:${CPATH}"
fi

# Nodebrew
if [ -d "${NODEBREW_ROOT}"  ]; then
  export NODEBREW_ROOT
  export PATH="${NODEBREW_ROOT}/current/bin:$PATH"
fi

# Julia
if [ -d "${JULIA_ROOT}" ]; then
  export JULIA_ROOT 
  export PATH="${JULIA_ROOT}/bin:$PATH"
fi

# Plenv
if [ -d "${PLENV_ROOT}" ]; then
  export PLENV_ROOT
  export PATH="${PLENV_ROOT}/bin:$PATH"
  eval "$(plenv init -)"
fi