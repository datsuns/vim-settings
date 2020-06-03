let g:my_home_directory = expand("$HOME") . "/.vim"
if has("win32")
  let g:my_home_directory = expand("$HOME") . "/vimfiles"
endif

set encoding=utf-8

"execute "source " . g:my_home_directory . "/dein.vim"
execute "source " . g:my_home_directory . "/settings.vim"
execute "source " . g:my_home_directory . "/map.vim"
execute "source " . g:my_home_directory . "/style.vim"
" should source from _gvimrc
"if has("gui_running")
execute "source " . g:my_home_directory . "/gui.vim"
"endif
let g:my_pj_dir = g:my_home_directory . "/_pj"
if isdirectory(g:my_pj_dir)
  set runtimepath += "g:my_pj_dir"
  execute "source " . g:my_pj_dir . "/root.vim"
endif

colorscheme my_color

