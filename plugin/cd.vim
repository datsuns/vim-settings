function! s:my_CdToCurrentBuffer()
  execute "lcd " . expand('%:p:h')
endfunction

command! -nargs=0 CdToCurrentBuffer call s:my_CdToCurrentBuffer()

