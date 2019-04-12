"let mapleader = "¥"

map <C-t>n :tabnew<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>

imap <C-@> <C-[>

noremap  L zl
noremap  H zh
noremap  <Space>w :w <CR>
noremap  <Space>gf :tabnew <cfile><CR>

noremap <silent> <Space>ev :edit ~/.vim<CR>
noremap <silent> <Space>ec :edit ~/.vim/colors<CR>
"noremap <silent> <Space>lv :source ~/.vimrc<CR>
noremap <silent> <Space>ed :edit ~/Desktop<CR>

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
nnoremap <Space>gc :Gcommit -v <Enter>
"}}}


"{{{ quickrun
let g:quickrun_no_default_key_mappings=1
silent! map <unique> <Space>r <Plug>(quickrun)
"}}}


"{{{ gtags
nnoremap <Space>gt :Gtags<CR>
nnoremap <Space>gT :tabnew<CR> :Gtags <cword><CR>
nnoremap <Space>gtr :Gtags -r<CR>
nnoremap <Space>gts :Gtags -s<CR>
"}}}


"{{{ TagList
nnoremap <Space>tl :Tlist<CR>
"}}}

"{{{ dirvsh
augroup my_dirvish_events
  autocmd!
    let g:dirvish_relative_paths = 0
    " Enable fugitive.vim in Dirvish buffers.
    autocmd FileType dirvish call fugitive#detect(@%)

    autocmd FileType dirvish map <buffer> u <Plug>(dirvish_up)
    autocmd FileType dirvish map <buffer> l i
    autocmd FileType dirvish map <buffer> h <Plug>(dirvish_up)
    autocmd FileType dirvish map <buffer> e <CR>
    autocmd FileType dirvish map <buffer> gc :execute 'lcd ' fnameescape(expand('%:p:h'))<CR>

    " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
    autocmd FileType dirvish nnoremap <silent><buffer>
      \ . :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>
augroup END
"}}}
