
let g:changelog_username = 'datsuns'

function! s:new_task_time(title)
	let str = "\t* " . strftime('%H:%M') . a:title . ' '
	call append( line('.'), str )
	call setpos( '.', [bufnr("%"), line('.') + 1, strlen(str)] )
endfunction
noremap <Leader>S <Esc>:call <SID>new_task_time('[S ]')<CR>
noremap <Leader>E <Esc>:call <SID>new_task_time('[ E]')<CR>
noremap <Leader>Oo <Esc>:call <SID>new_task_time('[--]')<CR>
