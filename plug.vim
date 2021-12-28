call plug#begin(g:my_home_directory . '/plug_repo')

Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/gtags.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'thinca/vim-quickrun'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" for *lang
Plug 'cespare/vim-toml',          { 'for': 'toml' }
Plug 'peterhoeg/vim-qml',         { 'for': 'qml' }
Plug 'vim-jp/cpp-vim',            { 'for': 'cpp' }
Plug 'PProvost/vim-ps1',          { 'for': 'ps1' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'thosakwe/vim-flutter',      { 'for': 'dart' } 
Plug 'posva/vim-vue',             { 'for': 'vue' } 
Plug 'mattn/vim-goimports',       { 'for': 'go' }
"Plug 'sebdah/vim-delve',          { 'for': 'go' }
Plug 'datsuns/vim-delve',         { 'for': 'go', 'branch': 'run_on_win_gvim' }
Plug 'rust-lang/rust.vim',        { 'for': 'rust' }
Plug 'gburca/vim-logcat',         { 'for': 'logcat' }

" for lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'mattn/vim-lsp-icons'

Plug 'mattn/vim-molder'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
"Plug 'ziglang/zig.vim', { 'for': 'zig' }
"Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

"Plug 'datsuns/vim-go-openimport', { 'for': 'go' }
"Plug 'datsuns/astyle.vim'
"Plug 'datsuns/vim-flutter', { 'branch': 'feature/merge_windows_job_error', 'for': 'dart' } 
Plug 'datsuns/vim-mml', { 'for': 'mml' } 
Plug 'datsuns/vim-mml-play', { 'for': 'mml' } 
Plug 'datsuns/vim-svn-explorer'

call plug#end()
