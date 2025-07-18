set history=10000
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set hlsearch
set autoindent
set smartindent
set ignorecase
set nowrap
set nowrapscan
set textwidth=0
set nocursorline
set matchtime=2
set cmdheight=1
set showcmd
set belloff=all
set nospell " replace to spelunker.vim
"set spell
set spelllang+=cjk
set updatetime=1000
set formatoptions-=ro

autocmd FileType * setlocal formatoptions-=cro

if has("win32") && has("gui_running")
  " w/ kaoriya patch 2005-ambiwidth_auto.diff
  set ambiwidth=auto
endif

set cursorline

set fileencodings-=default
set fileencodings-=latin1
set fileencodings+=cp932
set fileencodings+=default
set fileencodings+=latin1

set fileformats=unix,dos
set fileformat=unix
set fileformats=unix,dos

set diffopt+=vertical

set statusline=%m%F\ \ [%{&encoding}][%{&fileformat}]%y\ \ %l/%L\<%c>\ \ %P

" need to enable airline
set laststatus=2

if has("win32")
  set clipboard=autoselect
else
  set clipboard-=unnamedplus
endif
set foldmethod=marker

" from $VIMRUNTIME/defaults.vim
set backspace=indent,eol,start
set noruler
set nrformats-=octal

"plug.vimのコマンド実行に影響する
"set shell=$HOME/scoop/shims/bash.exe

