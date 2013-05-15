"let mapleader = "¥"

map <C-t>n :tabnew<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>

imap <C-@> <C-[>

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
