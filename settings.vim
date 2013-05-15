set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap

colorscheme my_color

augroup MyFiletypeGroup
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
	"autocmd BufWritePost,FileWritePost *_test.vim VimTest
	autocmd BufWinEnter,BufNewFile *_spec.coffee set filetype=coffee.vows
augroup END

" quickrun 
let g:quickrun_config = {}
let g:quickrun_config['_'] = {'outputter/buffer/split': 'split', 'outputter/buffer/into': '1'  }
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fs --color'}
let g:quickrun_config['markdown'] = {'outputter': 'browser' }
let g:quickrun_config['cpp'] = { 'command': 'g++', 'cmdopt': '-std=gnu++11 -g' }
let g:quickrun_config['coffee.vows'] = {'command': 'vows', 'args': '--spec',
        \ 'hook/coffee_vows_filter/enable': 1,
        \ }

" vimtest
let g:vimtest_config = {}

"{{{scala
function! s:my_start_sbt()
  execute 'VimShellInteractive sbt'
  stopinsert
  let t:sbt_bufname = bufname('%')
  if !has_key(t:, 'sbt_cmds')
    "let t:sbt_cmds = [input('t:sbt_cmds[0] = ')]
    let t:sbt_cmds = ['compile', 'run']
  endif
  wincmd p
endfunction

command! -nargs=0 StartSBT call <SID>my_start_sbt()

function! s:sbt_run()
  let cmds = get(t:, 'sbt_cmds', 'run')

  let sbt_bufname = get(t:, 'sbt_bufname')
  if sbt_bufname !=# ''
    call vimshell#interactive#set_send_buffer(sbt_bufname)
    call vimshell#interactive#send(cmds)
  else
    echoerr 'try StartSBT'
  endif
endfunction

function! s:vimrc_scala()
  nnoremap <buffer> <Space>m :<C-u>write<Cr>:call <SID>sbt_run()<Cr>
endfunction

augroup vimrc_scala
  autocmd!
  autocmd FileType scala call s:vimrc_scala()
  autocmd FileType scala nnoremap <buffer> <Space>st :<C-u>StartSBT
  autocmd FileType scala nnoremap <Space>ss :VimShellSendString 
augroup END
"}}}
