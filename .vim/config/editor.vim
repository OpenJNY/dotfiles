" Editor
" ---

" 括弧入力時の補完
inoremap { {}<Left
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
" 括弧の対応をハイライト
set showmatch

" 行番号表示
set number
" カーソル行の行番号をハイライト
set cursorline
hi clear CursorLine
set ruler

"不可視文字の表示形式
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:« 

" 印字不可能文字を16進数で表示
set display=uhex

" 検索時に全て英小文字で入力した場合のみ区別を無視する
set ignorecase
set smartcase
"インクリメンタルサーチを行う。 検索文字を打っている途中で、目的の単語を見つけたらEnterを押下すればよい。
set incsearch
" 検索語句のハイライト
set hlsearch

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

