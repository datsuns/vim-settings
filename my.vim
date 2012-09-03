augroup MyRSpec
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

source ~/.vim/settings.vim
source ~/.vim/map.vim
source ~/.vim/bundle.vim
if has("gui_running")
	source ~/.vim/gui.vim
endif

