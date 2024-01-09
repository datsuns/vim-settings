" Vim support file to detect file types
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2010 Jul 30

" Listen very carefully, I will say this only once
if exists("my_did_load_filetypes")
  finish
endif
let my_did_load_filetypes = 1

" Groovy
au BufNewFile,BufRead *.groovy,*.gradle			setf groovy

" Arduiono
au BufNewFile,BufRead *.ino			setf arduino

" changelog
au BufNewFile,BufRead *.changelog   setf changelog

" scala
au BufNewFile,BufRead *.scala   setf scala

" ruby (additional)
au BufNewFile,BufRead Gemfile,Gemfile.lock   setf ruby

" smv
au BufNewFile,BufRead *.smv   setf smv

" conf
au BufNewFile,BufRead *.conf		setf apache

" vue
autocmd FileType vue syntax sync fromstart

" asm
au BufNewFile,BufRead *.src		setf asm

" nu
au BufNewFile,BufRead *.nu,*.nujson,Nukefile    setf nu
