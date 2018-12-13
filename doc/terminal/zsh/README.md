# zsh のドキュメント

## インストール

### zsh のインストールとログインシェルの変更

#### Mac OS X の場合

Homebrew を使ってインストールするのが楽

```bash
brew install zsh
```

#### Ubuntu の場合

```bash
sudo apt install zsh
```

ちゃんとインストール出来たか確認

```bash
which zsh
```

デフォルトのログインシェルに設定するために，上記のパスを設定

```bash
$ chsh
Password:
Changing the login shell for ubuntu
Enter the new value, or press ENTER for the default
    Login Shell [/bin/bash]: /usr/bin/zsh
```

### fzf のインストール

* 更新日時：2018/12/14
* 最新の情報は [公式のインストール手順](https://github.com/junegunn/fzf#installation) を参照のこと

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

`install` を実行した時に `.bashrc` や `.zshrc` に初期化ファイルの読み込みを自動で追加するかを聞かれるが，既に記載しているので不要（`n` と入力）