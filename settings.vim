set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap
set undodir=$HOME/.vim/undo

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
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter/buffer/into': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fp --color'}
let g:quickrun_config['ruby.unittest'] = {'command': 'rake', 'args': 'test:units'}
let g:quickrun_config['markdown'] = {'outputter': 'browser' }
let g:quickrun_config['cpp'] = { 'command': 'g++', 'cmdopt': '-std=c++11' }
let g:quickrun_config['c'] = { 'command': 'gcc', 'cmdopt': '-std=c++11' }
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

"taglist{{{
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"}}}

"{{{neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}
