"let mapleader = "¥"

map <C-t>n :tabnew<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>

imap <C-@> <C-[>

noremap  L zl
noremap  H zh

noremap <silent> <Space>ev :edit ~/.vim<CR>
noremap <silent> <Space>ec :edit ~/.vim/colors<CR>
noremap <silent> <Space>lv :source ~/.vimrc<CR>
noremap <silent> <Space>ed :edit ~/Desktop<CR>

noremap <F10> :edit ~/work/memo/task_memo.changelog<CR>

" unite
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
noremap <Space>uf :Unite file<CR>
noremap <Space>ug :Unite vimgrep<CR>

" ino
noremap <silent> <Space>ib :!ino build<CR>
noremap <silent> <Space>iu :!ino upload<CR>
noremap <silent> <Space>is :!ino serial<CR>

"{{{ git
let g:git_no_map_default = 1
nnoremap <Space>gd :GitDiff<Enter>
nnoremap <Space>gD :GitDiff --cached<Enter>
nnoremap <Space>gs :GitStatus<Enter>
nnoremap <Space>gl :GitLog<Enter>
nnoremap <Space>ga :GitAdd<Enter>
nnoremap <Space>gA :GitAdd <cfile><Enter>
nnoremap <Space>gc :GitCommit -v<Enter>
nnoremap <Space>gp :GitPullRebase<Enter>
nnoremap <Space>gb :GitBlame<Enter>
nnoremap <Space>gV :Gitv --all<CR>
augroup gitv
  autocmd!
  autocmd FileType gitv nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  autocmd FileType gitv nnoremap <buffer> <silent> q :close<CR>
augroup END
"}}}

"{{{ quickrun
let g:quickrun_no_default_key_mappings=1
silent! map <unique> <Space>r <Plug>(quickrun)
"}}}

"{{{ gtags
nnoremap <Space>gt :Gtags<CR>
"}}}
