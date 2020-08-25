let g:my_home_directory = expand("$HOME") . "/.vim"
if has("win32")
  let g:my_home_directory = expand("$HOME") . "/vimfiles"
endif

set encoding=utf-8

execute "source " . g:my_home_directory . "/settings.vim"
execute "source " . g:my_home_directory . "/map.vim"
execute "source " . g:my_home_directory . "/style.vim"
execute "source " . g:my_home_directory . "/lsp.vim"

colorscheme my_color

