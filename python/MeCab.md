# MeCab

[mecab-ipadic-neologd/README.ja.md at master · neologd/mecab-ipadic-neologd](https://github.com/neologd/mecab-ipadic-neologd/blob/master/README.ja.md) を見ながら brew でインストールする。

* mecab-ipdic-neologd は新しいコーパスに基づく辞書ファイル
* インストールするのが吉


デフォルトで `/usr/local/lib/mecab/dic/mecab-ipadic/neologd` にインストールされるので、これを mecabrc に記述する

```bash
vim /usr/local/etc/mecab
```

```git
- dicdir =  /usr/local/lib/mecab/dic/ipadic
+ dicdir =  /usr/local/lib/mecab/dic/mecab-ipadic-neologd
```

