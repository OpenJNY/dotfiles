#$[ -f "$HOME/.bash_profile" ] && . "$HOME/.bash_profile"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

# Two regular plugins loaded without tracking.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# Binary relsease
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

### End of Zinit's installer chunk

# zsh settings:
# -----------------------
autoload colors
colors

setopt auto_list             # 補完候補が複数ある時に、一覧表示
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる

setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示

setopt print_eight_bit # 日本語ファイル名等8ビットを通す
setopt extended_glob # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots # 明確なドットの指定なしで.から始まるファイルをマッチ
setopt brace_ccl # 範囲指定できるようにする e.g. mkdir dir_{1-3}

# ディレクトリ移動関連
setopt auto_cd # cdを使わずにディレクトリを移動できる
setopt auto_pushd # "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt correct # 打ち間違いを指摘
DIRSTACKSIZE=100
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# 補完候補をハイライトする
autoload -Uz compinit && compinit

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
# zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
# zinit light trapd00r/LS_COLORS

if [[ -f ~/.dircolors && -x $(which dircolors) ]]; then
  eval `dircolors ~/.dircolors`
else
  LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
  export LS_COLORS
fi

if [ -n "$LS_COLORS" ]; then
  # zsh の補完（候補）にも dircolors を適用する
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

#---------------------------------------------------------------------------
# Alias
#---------------------------------------------------------------------------

alias ls="ls --color=auto -G"
alias ll='ls -ltr'
alias la="ls -lhAF --color=auto"

# History
# -------

# 参考: prezto/modlue/hitory

# 履歴の保存ファイル，保存件数（メモリ，ファイル）
export HISTFILE="${HOME}/.zhistory"
# メモリに保存されるヒストリ数
export HISTSIZE=10000
# 履歴ファイルに保存されるヒストリ数
export SAVEHIST=100000

# 履歴をすべてのセッションで共有する
setopt share_history
# コマンド実行時間も履歴に追加
setopt extended_history
# 重複を記録しない
setopt hist_ignore_dups
# 重複があれば古い履歴を削除
setopt hist_ignore_all_dups
# 保存時にもダブりがないように
setopt hist_save_no_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
# 履歴を展開してもすぐには実行しない
setopt hist_verify

# usecase:
function history-all { history -E 1 }

function my-history-search() {
  if type fzf >/dev/null 2>&1; then
    BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
    CURSOR=$#BUFFER
    # zle accept-line # 現在行に書かれてあるコマンドを実行する
    # zle clear-screen # 画面をクリア（一番上に現在行が来るようにシフト）
  else
    # バージョンによって条件分岐するために使用するモジュールを開放する
    autoload -Uz is-at-least

    # 4.3.9 以降ではインクリメンタルパターンサーチが出来るので、それを利用する
    # なければデフォルトでマッピングされているものを利用する
    if is-at-least 4.3.9; then
      # zsh -la <widget> とすることで、widget に完全一致するウィジェットが
      # 存在する場合、返却値 0 で終了する
      zle -la history-incremental-pattern-search-backward && bindkey "^r" history-incremental-pattern-search-backward
    else
      history-incremental-search-backward
    fi
  fi
}

# 作ったシェル関数をウィジェットに登録
zle -N my-history-search
# Ctrl + r にキーバインド
bindkey '^r' my-history-search

# プラットフォーム別の設定
# ただし，環境変数に関するものは zshenv で対応すること
case "${OSTYPE}" in
darwin*)
  [ -f "$MYZDOTDIR/darwin.zshrc" ] && source "$MYZDOTDIR/darwin.zshrc"
  ;;
linux*)
  [ -f "$MYZDOTDIR/linux.zshrc" ] && source "$MYZDOTDIR/linux.zshrc"
  ;;
esac

# ローカル専用の設定
# [ -f "$HOME/local.zshrc" ] && source "$HOME/local.zshrc"

# opt ディレクトリ以下に作成した自作 .zsh 設定を読み込む
for dotzsh in $MYZDOTDIR/opt/*.zsh; do
  source $dotzsh
done
