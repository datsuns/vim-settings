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


"vimfiler{{{
let g:vimfiler_as_default_explorer = 1
let g:unite_kind_openable_lcd_command = 'lcd'
autocmd FileType vimfiler nmap <buffer> <C-l> :tabnext<CR>
autocmd FileType vimfiler nmap <buffer> <F5>  <Plug>(vimfiler_redraw_screen)
"}}}

"gitv{{{
let g:Gitv_OpenPreviewOnLaunch = 0
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
  let g:goimports_simplify = 0
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


