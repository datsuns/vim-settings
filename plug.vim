call plug#begin(g:my_home_directory . '/plug_repo')

Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'itchyny/lightline.vim'
Plug 'juneedahamed/svnj.vim'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-matchfuzzy'
Plug 'justinmk/vim-dirvish'
Plug 'mattn/vim-goimports', { 'for': 'go' }
Plug 'mattn/vim-lsp-settings'
Plug 'motemen/git-vim'
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'previm/previm'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/cpp-vim', { 'for': 'cpp' }
Plug 'vim-scripts/autoscroll.vim'
Plug 'vim-scripts/gtags.vim'
Plug 'vim-scripts/taglist.vim'

Plug 'datsuns/astyle.vim'
Plug 'datsuns/vim-flutter', { 'branch': 'feature/merge_windows_job_error', 'for': 'dart' }
Plug 'datsuns/vim-go-openimport'
Plug 'datsuns/vim-mml'
Plug 'datsuns/vim-mml-play'


call plug#end()
