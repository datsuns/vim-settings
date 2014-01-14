set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap

set t_Co=256
colorscheme my_color

augroup MyFiletypeGroup
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  autocmd BufWinEnter,BufNewFile *spec_helper.rb set filetype=ruby.rspec
	autocmd BufWinEnter,BufNewFile *_test.rb set filetype=ruby.unittest
	"autocmd BufWritePost,FileWritePost *_test.vim VimTest
	autocmd BufWinEnter,BufNewFile *_spec.coffee set filetype=coffee.vows
augroup END

" quickrun
let g:quickrun_config = {}
"let g:quickrun_config['_'] = {'outputter/buffer/split': 'split', 'outputter/buffer/into': '1', 'runner' : 'vimproc' }
let g:quickrun_config['_'] = {
      \ 'outputter/buffer/split': 'split',
      \ 'runner' : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60
      \ 'outputter/buffer/into': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fs --color'}
let g:quickrun_config['ruby.unittest'] = {'command': 'rake', 'args': 'test:units'}
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
    let t:sbt_cmds = ['compile']
  endif
  wincmd p
endfunction

command! -nargs=0 StartSBT call <SID>my_start_sbt()

function! s:sbt_run(additional_cmd)
  let cmds = get(t:, 'sbt_cmds', 'run')
  if a:additional_cmd != ''
    let cmds = cmds + [a:additional_cmd]
  endif

  let sbt_bufname = get(t:, 'sbt_bufname')
  if sbt_bufname !=# ''
    call vimshell#interactive#set_send_buffer(sbt_bufname)
    call vimshell#interactive#send(cmds)
  else
    echoerr 'try StartSBT'
  endif
endfunction

function! s:vimrc_scala()
  nnoremap <buffer> <Space>m :<C-u>write<Cr>:call <SID>sbt_run('')<Cr>
  nnoremap <buffer> <Space>M :<C-u>write<Cr>:call <SID>sbt_run('run')<Cr>
endfunction

augroup vimrc_scala
  autocmd!
  autocmd FileType scala call s:vimrc_scala()
  autocmd FileType scala nnoremap <buffer> <Space>st :<C-u>StartSBT
  autocmd FileType scala nnoremap <Space>ss :VimShellSendString
augroup END
"}}}

"vimfiler{{{
let g:vimfiler_as_default_explorer = 1
let g:unite_kind_openable_lcd_command = 'lcd'
autocmd FileType vimfiler nmap <buffer> <C-l> :tabnext<CR>
autocmd FileType vimfiler nmap <buffer> <F5>  <Plug>(vimfiler_redraw_screen)
"}}}

"gitv{{{
let g:Gitv_OpenPreviewOnLaunch = 0
"}}}

"airline{{{
  let g:airline#extensions#whitespace#enabled = 1
  nnoremap <buffer> <Space>at :AirlineToggle<Cr>
"}}}

"vimshel{{{
autocmd FileType vimshell noremap <buffer> <F5> <Plug>(vimshell_clear)
autocmd FileType vimshell noremap <buffer> <C-l> :tabnext<CR>
"}}}

"javascript indenter{{{
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 2
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1
"}}}

"clever-f{{{
let g:clever_f_use_migemo=1
"}}}

"white space tailing{{{
autocmd FileType c,cpp,java,php,rst,make autocmd BufWritePre <buffer> :%s/\s$//e
"}}}
