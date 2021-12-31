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
augroup END

"{{{ skipping default loading
  let g:skip_defaults_vim  = 1
  let g:loaded_gzip        = 1
  let g:loaded_netrwPlugin = 1
  let g:loaded_tarPlugin   = 1
  let g:loaded_zipPlugin   = 1
"}}}

"{{{quickrun
let g:quickrun_config = {}
let g:quickrun_config['_'] = {
      \ 'outputter/buffer/split': 'split',
      \ 'runner' : 'job',
      \ 'outputter/buffer/into': '1'
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fd --color'}
let g:quickrun_config['ruby.unittest'] = {'command': 'rake', 'args': 'test:units'}
let g:quickrun_config['markdown'] = {'outputter': 'browser' }
let g:quickrun_config['cpp'] = { 'command': 'g++', 'cmdopt': '-std=c++11' }
let g:quickrun_config['c'] = { 'command': 'gcc', 'cmdopt': '-std=c11' }
let g:quickrun_config['coffee.vows'] = {'command': 'vows', 'args': '--spec',
        \ 'hook/coffee_vows_filter/enable': 1,
        \ }
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
"autocmd FileType c,cpp,java,php,rst,make autocmd BufWritePre <buffer> :%s/\s$//e
"}}}

"taglist{{{
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"}}}

"{{{golang

"{{{mattn/vim-goimports
  let g:goimports = 1
  let g:goimports_simplify = 1
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

"{{{molder
  let g:molder_show_hidden = 1
"}}}

"{{{ mml
  let g:mml#ppmck_location = expand('$HOME/tools/nsf/ppmck09a/mck')
  let g:mml#lame_command = expand('$HOME/tools/lame/lame')
  autocmd FileType mml nmap <buffer> <Space>r :PlayMml<CR>
  autocmd FileType mml nmap <buffer> <Space>q :StopMml<CR>
"}}}

"{{{ go-delv (go-debugger)
 let g:delve_cache_path = g:my_home_directory . "/cache/go-delv"

"}}}
