if exists("get_syntax_loaded")
    finish
endif

function! s:identify_syntax()
  execute 'synIDattr(synID(line("."), col("."), 0), "name")'
endfunction

command! -nargs=0 GetSyntax call s:identify_syntax()

let get_syntax_loaded = 1
