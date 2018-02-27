# Modern LaTeX

## Makefile でコンパイル

```sh
make
```

* 次のファイルに更新があればビルドするように設定している
  - `./*.tex`
  - `references.bib`
  - `./*.sty`
  - `./img/*.png`
  - `./img/*.pdf`

## latexmk でコンパイル

**使い方**
```sh
latexmk -pvc main
```

**メモ**
* 自動でディレクトリ内の`*.tex`ファイルの更新を検知してコンパイルし直してくれる
* 設定は `.latexmkrc` に記述
  - 基本はローカルファイル（`./.latexmkrc`）が優先
  - ローカルになければ `~/.latexmkrc` を使う
* オプションを `-pv` にすると自動更新なし

**注意点**
* 何回か立ち上げたりしてるといくつもプロセスが実行される状態になることがある
* 重くなったと思ったら，確認して軽くしておくと良い

```sh
# 確認
ps | grep perl
ps | grep latexmk

# 殺す
killall perl
```

