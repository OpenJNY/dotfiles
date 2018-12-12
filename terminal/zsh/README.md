# zsh のドキュメント

## インストール方法

### Ubuntu の場合

```bash
$ sudo apt install zsh
```

ちゃんとインストール出来たか確認

```bash
$ which zsh
```

デフォルトのログインシェルに設定するために，上記のパスを設定

```bash
$ chsh
Password:
Changing the login shell for ubuntu
Enter the new value, or press ENTER for the default
    Login Shell [/bin/bash]: /usr/bin/zsh
```

## ZDOTDIR について

zsh は最初に