" Encoding
" --------

" 内部で扱う文字コード
set encoding=utf-8

" 書き込み時の文字コード
set fileencoding=utf-8

" 読み込み時の文字コード．開ける文字コードが複数ある場合は左のものが優先
set fileencodings=utf-8,sjis,euc-jp,cp932,iso-2022-jp

set ffs=unix,dos,mac
set ff=unix

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932
