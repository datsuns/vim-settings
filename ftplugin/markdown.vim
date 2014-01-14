function! s:append_string(string)
  call append( line('.'), a:string )
  call setpos( '.', [buffer_number("%"), line('.') + 1, 100, 0] )
endfunction

function! s:dayly_meeting_timestamp( )
  call s:append_string("* " . strftime("%Y/%m/%d") . " ")
endfunction

function! s:todo_template( )
  call s:append_string("* [ ]")
endfunction

nnoremap <silent> <Space>S :call <sid>dayly_meeting_timestamp()<cr>
nnoremap <silent> <Space>T :call <sid>todo_template()<cr>
