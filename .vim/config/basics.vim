" Basics
" ------

syntax enable
filetype on
filetype plugin on
filetype indent on


let mapleader=","              " キーマップリーダー
set scrolloff=5                " スクロール時の余白確保
set wrap                       "
set textwidth=0                " 一行に長い文章を書いていても自動折り返しをしない
set autoread                   " 他で書き換えられたら自動で読み直す

set noswapfile                 " swap,undoファイルの作成 & backupファイルの保持はしない
set noundofile                 "
set nobackup                   "
set nowb                       " が，ファイルの上書きの前にはバックアップを作る。

set hidden                     " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions=lmoq         " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                   " ビープをならさない
set browsedir=buffer           " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set showcmd                    " 入力中のコマンドを表示する
set showmode                   " 現在のモードを表示
set viminfo='50,<1000,s100,\"50 " viminfoファイルの設定
set modelines=0                " モードラインは無効
set title                      " vimを使ってくれてありがとう

set wildmenu " コマンド補完時に一覧を表示する
set wildmode=longest:full,full " wildmenu の見た目を変更
" OSのクリップボードを使用する
set clipboard+=unnamed
set clipboard+=autoselect

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa

" insert mode で矢印キーが A,B,C,D 入力扱いになる
imap ^[OA <Up>
imap ^[OB <Down>
imap ^[OC <Right>
imap ^[OD <Left>
