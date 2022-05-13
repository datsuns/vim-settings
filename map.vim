"let mapleader = "¥"

map <Space>n :tabnew<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>

imap <C-@> <C-[>

noremap  L zl
noremap  H zh
noremap  <Space>w :w <CR>
nmap gf gF
nnoremap <silent> <Space>gf  :tabedit <C-r><C-F><CR>
noremap  <Space>y "*y<CR>
noremap  <Space>Y "*Y<CR>
noremap  <Space>p "*p<CR>
nnoremap <Space>cs    :nohlsearch<CR>

noremap <silent> <Space>ev :edit ~/.vim<CR>
noremap <silent> <Space>ec :edit ~/.vim/colors<CR>
"noremap <silent> <Space>lv :source ~/.vimrc<CR>
noremap <silent> <Space>ed :edit ~/Desktop<CR>
noremap <silent> <Space>ew :edit ~/work<CR>

"noremap <F10> :edit ~/work/memo/task_memo.changelog<CR>

noremap <silent> <Space>co :copen<CR>
noremap <silent> <Space>cc :cclose<CR>
noremap <silent> <C-n> :cn<CR>
noremap <silent> <C-p> :cp<CR>

"{{{ ino
"noremap <silent> <Space>ib :!ino build<CR>
"noremap <silent> <Space>iu :!ino upload<CR>
"noremap <silent> <Space>is :!ino serial<CR>
"}}}


"{{{ git
let g:git_no_map_default = 1
"nnoremap <Space>gd :GitDiff<Enter>
"nnoremap <Space>gD :GitDiff --cached<Enter>
"nnoremap <Space>gs :GitStatus<Enter>
nnoremap <Space>gl :GitLog<Enter>
nnoremap <Space>ga :GitAdd<Enter>
nnoremap <Space>gA :GitAdd <cfile><Enter>
"nnoremap <Space>gc :GitCommit <Enter>
"nnoremap <Space>gp :GitPullRebase<Enter>
nnoremap <Space>gb :GitBlame<Enter>
nnoremap <Space>gV :Gitv --all<CR>
augroup gitv
  autocmd!
  autocmd FileType gitv nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  autocmd FileType gitv nnoremap <buffer> <silent> q :close<CR>
augroup END
"}}}


"{{{ fugitive
nnoremap <Space>gs :Gstatus<Enter>
nnoremap <Space>gd :Gdiff<Enter>
nnoremap <Space>gc :Git commit -v <Enter>
"}}}


"{{{ quickrun
let g:quickrun_no_default_key_mappings=1
silent! map <unique> <Space>r <Plug>(quickrun)
"}}}


"{{{ gtags
function! s:my_gtags_search_reference(option, keyword)
  execute 'tabnew'
  execute 'Gtags ' . a:option . ' ' . a:keyword
endfunction
nnoremap [gtags]    <Nop>
nmap     <Space>g [gtags]
nnoremap <silent> [gtags]t :Gtags<CR>
nnoremap <silent> [gtags]T  :call <SID>my_gtags_search_reference("", expand('<cword>'))<CR>
nnoremap <silent> [gtags]tr :call <SID>my_gtags_search_reference("-r", expand('<cword>'))<CR>
nnoremap <silent> [gtags]ts :call <SID>my_gtags_search_reference("-s", expand('<cword>'))<CR>
nnoremap <silent> [gtags]tt :call <SID>my_gtags_search_reference("-t", expand('<cword>'))<CR>
nnoremap <silent> [gtags]tR :execute "Gtags -r " . @*<CR>
nnoremap <silent> [gtags]g :execute  "Gtags " . @*<CR>
"nnoremap <silent> [gtags]ts :Gtags -s<CR>
"nnoremap <silent> [gtags]tt :Gtags -t<CR>

"}}}


"{{{ TagList
nnoremap <Space>tl :Tlist<CR>
"}}}

""{{{ dirvsh
"augroup my_dirvish_events
"  autocmd!
"    let g:dirvish_relative_paths = 0
"    " Enable fugitive.vim in Dirvish buffers.
"
"    autocmd FileType dirvish map <buffer> u <Plug>(dirvish_up)
"    autocmd FileType dirvish map <buffer> l i
"    autocmd FileType dirvish map <buffer> h <Plug>(dirvish_up)
"    autocmd FileType dirvish map <buffer> e <CR>
"    autocmd FileType dirvish map <buffer> gc :execute 'lcd ' fnameescape(expand('%:p:h'))<CR>
"    autocmd FileType dirvish silent! unmap -
"
"    " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
"    autocmd FileType dirvish nnoremap <silent><buffer>
"      \ . :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>
"augroup END
""}}}

"{{{ flutter-vim
augroup flutter_vim_maps
  autocmd!
  "autocmd FileType dart nnoremap <Space>fr :FlutterHotReload<cr>
  autocmd FileType dart nnoremap <Space>lr :FlutterRun<cr>
  autocmd FileType dart nnoremap <Space>lf :execute("FlutterRun -d " . expand('<cword>'))<cr>
  autocmd FileType dart nnoremap <Space>lR :FlutterHotRestart<cr>
  autocmd FileType dart nnoremap <Space>ld :FlutterDevices<cr>
  autocmd FileType dart nnoremap <Space>lq :FlutterQuit<cr>
augroup END
"}}}

""{{{ fzf
"augroup fzf_maps
"  autocmd!
"  nnoremap <silent> <Space>f  :Files .<cr>
"augroup END
""}}}

"{{{ ctrlp
augroup ctrlp_maps
  autocmd!
  nnoremap <silent> <Space>f  :CtrlP <cr>
  nnoremap <silent> ,,        :CtrlPMRU <cr>
augroup END
"}}}

"{{{ molder
  autocmd FileType molder map <buffer> gc :execute 'lcd ' fnameescape(expand('%:p:h'))<CR>
  autocmd FileType molder map <buffer> e <Plug>(molder-open)
  autocmd FileType molder map <buffer> l <Plug>(molder-open)
  autocmd FileType molder map <buffer> h <Plug>(molder-up)
  autocmd FileType molder map <buffer> <F5> <Plug>(molder-reload)
"}}}
