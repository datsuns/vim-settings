set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap

colorscheme my_color

set tabstop=4
set shiftwidth=4
set ignorecase
set incsearch
set hlsearch
set nowrap
set nowrapscan
set autoindent
set cmdheight=1

set fileencodings-=default
set fileencodings-=latin1
set fileencodings+=cp932
set fileencodings+=default
set fileencodings+=latin1

" for RSpec for quickrun 
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fs --color'}

