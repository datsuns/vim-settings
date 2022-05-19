colorscheme my_color

if has("win32")
  set guifont=MyricaM_M:h20:cSHIFTJIS:qDRAFT
  set renderoptions=type:directx
  set guioptions+=C
  autocmd GUIEnter * simalt ~x
else
  "set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
  set guifont=Menlo\ Regular:h26
endif
set guioptions-=b
set guioptions-=l
set guioptions-=r
set guioptions-=e
set guioptions-=m
set guioptions-=M
set guioptions-=T
"set guioptions+=P
set guioptions+=R

function! GuiTabLabel()
    return fnamemodify(bufname(winbufnr(1)), ":t")
    "return bufname("%")
endfunction
set guitablabel=%{GuiTabLabel()}

noremap <silent> <F12> :set guifont=*<CR>
noremap <silent> <F11> :set guioptions+=C<CR>
noremap <silent> <F10> :set guioptions-=C<CR>
