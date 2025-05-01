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
let g:quickrun_config['cpp'] = { 'command': 'g++', 'cmdopt': '-std=c++23' }
let g:quickrun_config['c'] = { 'command': 'gcc', 'cmdopt': '-std=c17' }
let g:quickrun_config['coffee.vows'] = {'command': 'vows', 'args': '--spec',
        \ 'hook/coffee_vows_filter/enable': 1,
        \ }
"}}}


"javascript indenter{{{
let g:SimpleJsIndenter_BriefMode = 2
let g:SimpleJsIndenter_CaseIndentLevel = -1
"}}}

"taglist{{{
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"}}}

"{{{golang

"{{{mattn/vim-goimports
  let g:goimports = 1
  let g:goimports_simplify = 0
"}}}

"{{{ go-delv (go-debugger)
 let g:delve_cache_path = g:my_home_directory . "/cache/go-delv"
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
      \   'colorscheme': 'OldHope',
      \ }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ] }
let g:lightline.tab = {
    \ 'active': [ 'filename', 'modified' ],
    \ 'inactive': [ 'filename', 'modified' ] }
let g:lightline.component = {
      \ 'charvaluehex': '%04B',
      \ }
"}}}


"{{{previm
let g:previm_show_header = 0
"}}}

"{{{dirvish
" let g:loaded_netrwPlugin = 1
" command! -nargs=? -complete=dir Explore Dirvish <args>
" command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
" command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
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
let g:dartfmt_options = ['--line-length 120']
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

"{{{ fzf
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }
"let g:fzf_layout = { 'window': 'enew' }
"}}}

"{{{ rust
let g:rustfmt_autosave = 1
let g:rust_fold = 1
"}}}

"{{{ ctrlp
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<Space>f'
"}}}

"{{{ binary
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
"augroup BinaryXXD
"  autocmd!
"  autocmd BufReadPre  *.bin let &binary =1
"  autocmd BufReadPost * if &binary | silent %!xxd -g 1
"  autocmd BufReadPost * set ft=xxd | endif
"  autocmd BufWritePre * if &binary | %!xxd -r | endif
"  autocmd BufWritePost * if &binary | silent %!xxd -g 1
"  autocmd BufWritePost * set nomod | endif
"augroup END
"}}}

"{{{ spelunker.vim
" Enable spelunker.vim. (default: 1)
" 1: enable
" 0: disable
let g:enable_spelunker_vim = 1

" Enable spelunker.vim on readonly files or buffer. (default: 0)
" 1: enable
" 0: disable
let g:enable_spelunker_vim_on_readonly = 0

" Check spelling for words longer than set characters. (default: 4)
let g:spelunker_target_min_char_len = 4

" Max amount of word suggestions. (default: 15)
let g:spelunker_max_suggest_words = 15

" Max amount of highlighted words in buffer. (default: 100)
let g:spelunker_max_hi_words_each_buf = 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 2

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 0

" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  "autocmd BufWinEnter,BufWritePost *.js,*.jsx,*.json,*.{vim,md,c,cpp,h,hpp} call spelunker#check()
  autocmd BufWinEnter,BufWritePost * call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  "autocmd CursorHold *.js,*.jsx,*.json,*.{vim,md,c,cpp,h,hpp} call spelunker#check_displayed_words()
  autocmd CursorHold * call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
"}}}

"""pdf
augroup MyAutoCmd
    if executable('pdftotext')
        " PDFファイルを開いた時、text形式に変換してから開く
        autocmd BufRead *.pdf :enew | 0read !pdftotext -layout -nopgbrk "#" -
    endif
augroup END
"""
