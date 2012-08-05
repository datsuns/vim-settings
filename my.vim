source ~/.vim/settings.vim
source ~/.vim/map.vim
if has("gui_running")
	source ~/.vim/gui.vim
endif

" for RSpec for quickrun 
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}

augroup MyRSpec
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

