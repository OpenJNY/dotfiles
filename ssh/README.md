# ssh に関する設定

## GitHub への接続

#### ssh keyの新規登録

1. 例のごとく RSA 暗号で公開鍵/秘密鍵を生成する（念のため権限を付与）．

```
$ mkdir ~/.ssh/github-hoge

$ ssh-keygen -t rsa -b 4096 -C "hoge@gmail.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/username/.ssh/id_rsa): /Users/username/.ssh/github-hoge/id_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
...

$ chmod 600 ~/.ssh/github-hoge/id_rsa
```

2. 生成した公開鍵をGitHubに登録する．

```sh
$ cat ~/.ssh/github-hoge/id_rsa.pub | pbcopy
```

3. `~/.ssh/config` の登録

```
Host github.com.hoge
    HostName github.com
    User git
    Port 22
    IdentityFile ~/.ssh/github-hoge/id_rsa
    TCPKeepAlive yes
    IdentitiesOnly yes
```

ここで，Hostに与える名前（例では`github.com.hoge`）が重要になってくる．

```
git clone git@{github.com.hoge}:google/googletest.git
```

メインのアカウントであれば `Host github.com` としておけば問題ない．
git の global 設定 (`~/.gitconfig`) と同じメールアドレスの GitHub アカウントが推奨．

#### サブアカウントでのGitHub接続

リモートからのクローンおよび登録は，`~/.ssh/config` の Host の後に指定した `{github.com.hoge}` みたいなのを使って以下のように実行する．

```sh
$ git clone git@{github.com.hoge}:google/googletest.git
$ git remote add origin git@{github.com.hoge}:google/googletest.git
```

あとは `~/.gitconfig` に記述してあるアカウントで編集したくないのであれば，忘れずにローカルのアカウント設定を行うこと．
しとかないと，垢バレの恐れあり．

```sh
$ git config user.name [サブアカウントのユーザー名]
$ git config user.email [サブアカウントのメールアドレス]
```

