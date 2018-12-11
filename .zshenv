
# ZDOTDIR は zsh 設定ファイル（ドットファイル）の設置場所
#
# (c.f.) zsh がログインシェルで読み込むファイル一覧とその順番
# /etc/zshenv
# $ZDOTDIR/.zshenv
# /etc/zprofile
# $ZDOTDIR/.zprofile
# /etc/zshrc
# $ZDOTDIR/.zshrc
# /etc/zlogin
# $ZDOTDIR/.zlogin
export ZDOTDIR=$HOME/.zsh

# 本当の .zshenv を呼び出す
# この後 zsh は上記ファイルの `/etc/zprofile` の読み込みから再開する
if [ -f "$ZDOTDIR/.zshenv" ] ; then
  source $ZDOTDIR/.zshenv
fi