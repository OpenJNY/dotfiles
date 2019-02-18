" Editor
" ==========

" insertモードを抜けるとIMEオフ
" ------
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>


" tab
" ---

set tabstop=2 " タブが何文字分として表示されるか
set expandtab " インデントの生成，タブキーを推した時にスペースを挿入
set softtabstop=2 " タブキーを押した時に何文字の空白にするか
set shiftwidth=2 " 自動インデントの際に，何文字空けるか
set autoindent

set number     " 行番号表示
set cursorline " カーソル行の行番号をハイライト
hi  clear CursorLine " カーソルラインを表示しない
set ruler      "
set list       " 不可視文字の表示
set listchars=tab:»-,trail:-,eol:⏎,extends:»,precedes:« " 不可視文字の表示形式
set display=uhex        " 印字不可能文字を16進数で表示


" 括弧入力時の補完
" -----
" inoremap { {}<Left>
" inoremap [ []<Left>
" inoremap ( ()<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>


set showmatch           " 括弧の対応をハイライト

" Ctrl + hjkl でウィンドウ間を移動
" -----
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" insert mode 中での移動
"

set expandtab           " Tabキーを空白に変換


" 検索
" -----
set ignorecase          " ケースを無視して検索する
set smartcase           " ただし，大文字が混ざっている場合はケースを無視しない
set incsearch           " インクリメンタルサーチを行う．
                        " 検索文字を打っている途中で、目的の単語を見つけたらEnterを押下すればよい
set hlsearch            " 検索語句のハイライト

" 全角スペースの表示
" -----
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/


" バッファ
" --------------
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>
