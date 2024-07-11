set encoding=utf-8

execute "source " . g:my_home_directory . "/plug.vim"
execute "source " . g:my_home_directory . "/settings.vim"
execute "source " . g:my_home_directory . "/map.vim"
execute "source " . g:my_home_directory . "/style.vim"
execute "source " . g:my_home_directory . "/lsp.vim"

if filereadable(expand(g:my_home_directory . "/_pj/entry.vim"))
    execute "source " . g:my_home_directory . "/_pj/entry.vim"
endif

colorscheme my_color

