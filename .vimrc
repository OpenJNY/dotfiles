" Note: Neither vim-tiny nor vim-small
if 0 | endif

" Note: Be iMproved
if &compatible
  set nocompatible
endif

runtime! config/encoding.vim

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
let s:dein_dir       = expand('~/.vim/bundles')
let s:dein_repo_dir  = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir       = expand('~/.vim/dein')
let s:toml_file      = s:toml_dir . '/dein.toml'
let s:lazy_toml_file = s:toml_dir . '/dein_lazy.toml'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Load and cached toml
  " all plugins listed in toml

  " Note: load toml when start vim or open a certain file.
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
" }}}

filetype plugin indent on
syntax enable

if has('vim_starting') && dein#check_install()
  call dein#install()
endif


runtime! config/*.vim
runtime! config/plugins/*.vim
