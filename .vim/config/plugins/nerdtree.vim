" Settings for NERDTree

nmap <silent><C-n> :NERDTreeToggle<CR>

" ブックマークを初期表示
let g:NERDTreeShowBookmarks=1

" 起動時に NERDTree を表示
autocmd vimenter * NERDTree
" ただし、ファイル名を指定して開いた時は非表示
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ディレクトリ表示記号を変更
let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable  = '▶'
" let g:NERDTreeDirArrowCollapsible = '▼'

let g:NERDTreeShowHidden = 1
