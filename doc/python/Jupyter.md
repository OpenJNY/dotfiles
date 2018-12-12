# Jupyter

Jupyter Notebook/Lab の使い方についてのメモ書き．

## リモートからサーバの jupyter notebook にアクセスする

0. サーバに ssh かなんかで接続しておく．

1. ipython で認証用の sha 鍵を取得する．

```bash
$ ipython
Python 3.6.3 |Anaconda, Inc.| (default, Nov 20 2017, 20:41:42)
Type 'copyright', 'credits' or 'license' for more information
IPython 6.2.1 -- An enhanced Interactive Python. Type '?' for help.

In [1]: from notebook.auth import passwd; passwd()
   ...:
Enter password:
Verify password:
Out[1]: 'sha1:foooooooooo'

In [2]: exit()
```

2. jupyter の設定ファイルを作成する．

```bash
$ jupyter notebook --generate-config
Overwrite /home/openjny/.jupyter/jupyter_notebook_config.py with default config? [y/N]y
Writing default config to: /home/openjny/.jupyter/jupyter_notebook_config.py
```

3. 先程の認証鍵を使って `~/.jupyter/jupyter_notebook_config.py` を編集する．

```
c = get_config()

# localhost以外からもアクセス可能にする
c.NotebookApp.ip = '*'
# 生成した sha 鍵
c.NotebookApp.password = u'sha1:foooooooooo'
# サーバのポートを指定 (default: 8888)
c.NotebookApp.port = 8888
# サーバ内でブラウザを立ち上げない
c.NotebookApp.open_browser = False
# 作業ディレクトリを指定
# c.NotebookApp.notebook_dir = '~/jupyter_work'
```

4. jupyter notebook を起動

```bash
$ jupyter notebook
```

5. ローカルマシンに戻って，`http://<server_ip>:<jupyter_port=8888>` にブラウザ経由で接続するとパスワードを求められるので認証する．

#### おまけ

ssh で接続するときにポートフォワーディングしておくと，いつものように `http://localhost:8888` でアクセスできる．

```bash
$ ssh -L <jupyter_port>:localhost:8888 <username>@<server_ip>
```

この設定を ssh の config に書いとくと便利．

```
Host jupterserver
  User <username>
  HostName <server_ip>
  LocalForward <jupyter_port> localhost:8888
```
