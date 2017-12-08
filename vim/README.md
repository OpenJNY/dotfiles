# Vim

vimの設定．

## プラグイン管理

#### Dein.vim

* vimのプラグインマネージャ（あの有名なNeoBundleの後継）
* https://github.com/Shougo/dein.vim

#### インストール

適当なディレクトリにインストーラを走らせる．

```sh
mkdir -p ~/.vim/bundles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles
```

終わると「こんな感じの設定を.vimrcにしようね」と表示されるので，無駄な抵抗はしないで従う．

```vim
" dein settings {{{
let s:dein_dir = expand('~/.vim/bundles')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('~/.vim/dein')
let s:toml_file = s:toml_dir . '/dein.toml'
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
```

#### 参考

* http://takkii.hatenablog.com/entry/2016/09/06/095820

## vimrc


```vim
runtime! config/*.vim
runtime! config/plugins/*.vim
```

#### 参考

* https://qiita.com/kojionilk/items/67379e68cf54d811081a
* https://qiita.com/norifumi-y@github/items/4e058ac425968b26da22s