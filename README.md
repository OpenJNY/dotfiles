# dotfiles

## 使い方

Install

```bash
git clone git@github.com:OpenJNY/dotfiles.git ~/dotfiles
~/dotfiles/setup.sh
(cat /etc/shells | grep zsh >/dev/null) && chsh -s $(which zsh)
```

Uninstall

```bash
~/dotfiles/uninstall.sh
```

## ファイルの説明

* ドットから始まるファイル（e.g. `.latexmkrc`）
    * `$HOME` にシンボリックリンクを貼る設定ファイル
    * ただし `.gitignore` は例外
* ドットから始まるディレクトリ（e.g. `.zsh`）
    * `$HOME` にシンボリックリンクを貼る設定ディレクトリ
* ドットから始まらないディレクトリ（e.g. `homebrew`）
    * ソフトウェアやツールの使い方をまとめたドキュメント
    * `doc/README.md` にインストール方法などの簡易説明，それ以外の md ファイルに Tips などを記載
