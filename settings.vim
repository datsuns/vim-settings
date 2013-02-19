set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap

colorscheme my_color


augroup MyFiletypeGroup
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
	"autocmd BufWritePost,FileWritePost *_test.vim VimTest
augroup END

" for RSpec for quickrun 
let g:quickrun_config = {}
let g:quickrun_config['_'] = {'outputter/buffer/split': 'split', 'outputter/buffer/into': '1'  }
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fs --color'}
let g:quickrun_config['markdown'] = {'outputter': 'browser' }
let g:quickrun_config['cpp'] = { 'command': 'g++', 'cmdopt': '-std=gnu++11 -g' }

" vimtest
let g:vimtest_config = {}
