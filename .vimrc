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

set runtimepath+=~/.vim/

let mapleader = ","
autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp

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

if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'tpope/vim-pathogen'
NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \ 'windows' : 'make -f make_mingw32.mak',
            \ 'cygwin' : 'make -f make_cygwin.mak',
            \ 'mac' : 'make -f make_mac.mak',
            \ 'unix' : 'make -f make_unix.mak',
            \ },
            \ }
NeoBundle 'supermomonga/vimshell-kawaii.vim'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'SHougo/neocomplete'
NeoBundle 'sjl/badwolf'
" Unite vesting で簡単テスト
NeoBundle 'Shougo/vesting'
NeoBundle "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}



call neobundle#end()


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

silent NeoBundleInstall

" Required:
filetype plugin indent on


"下の猫がうっとおしかったらこことNeoBundleの部分を消してください
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

syntax on
colorscheme badwolf
highlight Normal ctermbg=none

" Jedi for python
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}



NeoBundleLazy 'hynek/vim-python-pep8-indent'


