"dein Scripts-----------------------------
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
execute "set runtimepath+=" . g:my_home_directory . "/dein/repos/github.com/Shougo/dein.vim"
"set runtimepath+=g:my_home_directory . "/dein/repos/github.com/Shougo/dein.vim"
"set runtimepath+=expand(g:my_home_directory) . "/dein/repos/github.com/Shougo/dein.vim"

" Required:
if dein#load_state(g:my_home_directory . '/dein')
  call dein#begin(g:my_home_directory . '/dein')

  call dein#load_toml(g:my_home_directory . '/dein.toml', {'lazy': 0})

  "" Let dein manage dein
  "" Required:
  "call dein#add(g:my_home_directory . '/dein/repos/github.com/Shougo/dein.vim')
  "
  "" Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  "
  "" You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
