
let g:changelog_username = 'datsuns'

function! s:new_task_time(title)
	let str = "\t* " . strftime('%H:%M') . a:title . ' '
	call append( line('.'), str )
	call setpos( '.', [bufnr("%"), line('.') + 1, strlen(str)] )
endfunction
noremap <Space>S <Esc>:call <SID>new_task_time('[S ]')<CR>
noremap <Space>E <Esc>:call <SID>new_task_time('[ E]')<CR>
noremap <Space>Oo <Esc>:call <SID>new_task_time('[--]')<CR>
