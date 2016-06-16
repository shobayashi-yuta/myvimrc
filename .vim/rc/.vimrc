" my vim settings
" Author: yuya aoki
"	and Fujie lab members

set number
set noswapfile
set cmdheight=2
set title
set wildmenu
set smartcase
set hlsearch
set background=dark
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set list
set listchars=tab:>-,extends:<,trail:-
set backspace=indent,eol,start
set tabstop=4

set runtimepath+=~/.vim/:~/.vim/ftplugin/

let mapleader = ","
autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp
autocmd BufNewFile *.sh 0r $HOME/.vim/template/template.sh


nmap	<Space>u [unite]

" OSの判定
if has('win32')
	let ostype = "Win"
elseif has('mac')
	let ostype = "Mac"
else
	let ostype = system("uname")
endif

" put esc-key for delete highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:dein_enabled = 1
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
    call dein#load_toml(s:toml_file)
    call dein#add('Shougo/unite.vim', {
        \ 'depends': ['vimproc'],
        \ 'on_cmd': ['Unite'],
        \ 'lazy': 1})
    if has('lua')
      call dein#add('Shougo/neocomplete.vim', {
            \ 'on_i': 1,
            \ 'lazy': 1})

      call dein#add('ujihisa/neco-look', {
            \ 'depends': ['neocomplete.vim']})
	endif
      call dein#add('davidhalter/jedi-vim', {
			\ 'autoload': {'filetypes': ['python','python3','djangohtml']}})

  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}


if s:dein_enabled && dein#tap("unite.vim")
  nnoremap [unite] <Nop>
  nmap <Leader>u [unite]
  nnoremap <silent> [unite]b :Unite buffer<CR>
endif

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif

"End dein Scripts-------------------------

syntax on
highlight Normal ctermbg=none