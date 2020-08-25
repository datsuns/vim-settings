execute ":set backupdir=" . g:my_home_directory . "/backup"
execute ":set directory=" . g:my_home_directory . "/swap"
execute ":set undodir="   . g:my_home_directory . "/undo"

set t_Co=256

augroup MyFiletypeGroup
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  autocmd BufWinEnter,BufNewFile *spec_helper.rb set filetype=ruby.rspec
	autocmd BufWinEnter,BufNewFile *_test.rb set filetype=ruby.unittest
	"autocmd BufWritePost,FileWritePost *_test.vim VimTest
	"autocmd BufWinEnter,BufNewFile *_spec.coffee set filetype=coffee.vows
augroup END

"{{{quickrun
let g:quickrun_config = {}
"let g:quickrun_config['_'] = {'outputter/buffer/split': 'split', 'outputter/buffer/into': '1', 'runner' : 'vimproc' }
let g:quickrun_config['_'] = {
      \ 'outputter/buffer/split': 'split',
      \ 'runner' : 'job',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter/buffer/into': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fd --color'}
let g:quickrun_config['ruby.unittest'] = {'command': 'rake', 'args': 'test:units'}
let g:quickrun_config['markdown'] = {'outputter': 'browser' }
let g:quickrun_config['cpp'] = { 'command': 'g++', 'cmdopt': '-std=c++11' }
let g:quickrun_config['c'] = { 'command': 'gcc', 'cmdopt': '-std=c++11' }
let g:quickrun_config['coffee.vows'] = {'command': 'vows', 'args': '--spec',
        \ 'hook/coffee_vows_filter/enable': 1,
        \ }
"}}}

"{{{vimtest
"let g:vimtest_config = {}
"}}}

"{{{scala
"function! s:my_start_sbt()
"  execute 'VimShellInteractive sbt'
"  stopinsert
"  let t:sbt_bufname = bufname('%')
"  if !has_key(t:, 'sbt_cmds')
"    "let t:sbt_cmds = [input('t:sbt_cmds[0] = ')]
"    let t:sbt_cmds = ['compile']
"  endif
"  wincmd p
"endfunction
"
"command! -nargs=0 StartSBT call <SID>my_start_sbt()
"
"function! s:sbt_run(additional_cmd)
"  let cmds = get(t:, 'sbt_cmds', 'run')
"  if a:additional_cmd != ''
"    let cmds = cmds + [a:additional_cmd]
"  endif
"
"  let sbt_bufname = get(t:, 'sbt_bufname')
"  if sbt_bufname !=# ''
"    call vimshell#interactive#set_send_buffer(sbt_bufname)
"    call vimshell#interactive#send(cmds)
"  else
"    echoerr 'try StartSBT'
"  endif
"endfunction
"
"function! s:vimrc_scala()
"  nnoremap <buffer> <Space>m :<C-u>write<Cr>:call <SID>sbt_run('')<Cr>
"  nnoremap <buffer> <Space>M :<C-u>write<Cr>:call <SID>sbt_run('run')<Cr>
"endfunction
"
"augroup vimrc_scala
"  autocmd!
"  autocmd FileType scala call s:vimrc_scala()
"  autocmd FileType scala nnoremap <buffer> <Space>st :<C-u>StartSBT
"augroup END
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

""airline{{{
"  "let g:airline#extensions#whitespace#enabled = 1
"  "nnoremap <buffer> <Space>at :AirlineToggle<Cr>
"  let g:airline#extensions#branch#enabled = 0
""}}}


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
"autocmd FileType c,cpp,java,php,rst,make autocmd BufWritePre <buffer> :%s/\s$//e
"}}}

"taglist{{{
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"}}}

"{{{golang
"{{{vim-go
" to enable :GoDef etc.
autocmd FileType go filetype plugin indent on
" customized mapping
autocmd FileType go nnoremap <buffer> <silent> <Space><C-]> :<C-u>call go#def#Jump("tab")<CR>

let g:go_fmt_autosave = 1
"}}}
"}}}

"{{{vim-metarw-svn
let g:metaraw_svn_repository_list = {
      \'hello': 'https://github.com/datsuns/vim-settings.git/',
      \}
"}}}

"{{{for python
set pyxversion=3
"}}}

"{{{lightline
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ }
let g:lightline.tab = {
    \ 'active': [ 'filename', 'modified' ],
    \ 'inactive': [ 'filename', 'modified' ] }
"}}}

"{{{deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#complete_method = "omni"
"let g:deoplete#enable_yarp = 1
"let g:deoplete#sources     = {}
"let g:deoplete#sources._   = ['buffer']
"let g:deoplete#sources.c   = ['buffer', 'tag']
"let g:deoplete#sources.cpp = ['buffer', 'tag']
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
"}}}

"{{{clang_complete
"}}}


"{{{previm
let g:previm_show_header = 0
"}}}

"{{{dirvish
  let g:loaded_netrwPlugin = 1
  command! -nargs=? -complete=dir Explore Dirvish <args>
  command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
  command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
"}}}

"{{{vim-flutter
  let g:flutter_show_log_always_tab=0
  let g:flutter_use_last_run_option=1
  let g:flutter_default_output_tab_num=0
"}}}

"{{{astyle
  let g:astyle#option_file=expand("$HOME") . "/astyle.option"
"}}}

"{{{dart
augroup MyDartSetting
	autocmd!
  autocmd BufWritePost *.dart   :execute("DartFmt")
augroup END
"}}}


"{{{lsp
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
"}}}

