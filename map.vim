"let mapleader = "¥"

map <C-t>n :tabnew<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>

imap <C-@> <C-[>

noremap <Leader>ev :edit ~/.vim<CR>
noremap <Leader>ec :edit ~/.vim/colors<CR>
noremap <Leader>lv :source ~/.vimrc<CR>

map <F10> :edit ~/work/memo/task_memo.changelog<CR>

noremap <Leader>uf :Unite file<CR>

" ino
noremap <Leader>ib :!ino build<CR>
noremap <Leader>iu :!ino upload<CR>
noremap <Leader>is :!ino serial<CR>
