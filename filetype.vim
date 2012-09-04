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
