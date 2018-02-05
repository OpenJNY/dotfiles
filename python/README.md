# Python 環境の構築
* Date: 2017/12/08

## pyenv

GitHub から最新の pyenv をクローンする．


```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

Mac なら Homebrew で pyenv をインストールしても良い．

```bash
brew update && brew upgrade
brew install pyenv
```


`.bash_profile`とか`.zshrc`に以下を記述してパスを通す．

```bash
export PYENV_ROOT="$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

## Miniconda

pyenvからMiniconda3(latest version)のインストール

```bash
pyenv install -l
pyenv install miniconda3-latest
```

デフォルトに指定するpythonの指定

```bash
pyenv global anaconda3-latest
```

確認

```bash
pyenv rehash
python3 --version
```

必要そうなライブラリをインストール

```bash
conda install numpy scipy scikit-learn matplotlib pandas jupyter
```
