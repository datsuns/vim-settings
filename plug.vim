call plug#begin(g:my_home_directory . '/plug_repo')

Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/gtags.vim'
Plug 'vim-jp/cpp-vim', { 'for': 'cpp' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'thinca/vim-quickrun'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'mattn/vim-lsp-icons'
Plug 'mattn/vim-goimports', { 'for': 'go' }
Plug 'mattn/vim-molder'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'cespare/vim-toml', { 'for': 'toml' }
"Plug 'ziglang/zig.vim', { 'for': 'zig' }
"Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

"Plug 'datsuns/vim-go-openimport', { 'for': 'go' }
"Plug 'datsuns/astyle.vim'
Plug 'datsuns/vim-flutter', { 'branch': 'feature/merge_windows_job_error', 'for': 'dart' } 
Plug 'datsuns/vim-mml', { 'for': 'mml' } 
Plug 'datsuns/vim-mml-play', { 'for': 'mml' } 

call plug#end()
