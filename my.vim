let g:my_home_directory = "$HOME/.vim"
if has("win32")
  let g:my_home_directory = "$HOME/vimfiles"
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

colorscheme my_color

