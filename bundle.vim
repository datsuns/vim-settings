set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" installed plugins
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'open-browser.vim'
NeoBundle 'Markdown'
NeoBundle 'fakeclip'
NeoBundle 'Markdown'
NeoBundle 'open-browser.vim'
NeoBundle 'Arduino-syntax-file'
NeoBundle 'TwitVim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kannokanno/vimtest'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'taglist.vim'
NeoBundle 'gtags.vim'
NeoBundle 'datsuns/quickrun-hooks.vim'
NeoBundle 'vim-coffee-script'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'endwise.vim'
NeoBundle 'scala.vim' " 0.1   syntaxic coloration for Scala code
NeoBundle 'motemen/git-vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'leafo/moonscript-vim'
NeoBundle 'bbatsov/rubocop'
NeoBundle 'thinca/vim-ref'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'kana/vim-metarw'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'mattn/webapi-vim'

NeoBundle 'datsuns/vim-smv'
NeoBundle 'datsuns/vim-metarw-svn'
NeoBundle 'vim-metarw-qiita'

 filetype plugin indent on     " Required!
 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 NeoBundleCheck
