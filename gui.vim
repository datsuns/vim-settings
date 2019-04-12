if has("win32")
  set guifont=Myrica_M:h20:cSHIFTJIS:qDRAFT
  set renderoptions=type:directx
  set guioptions+=C
  autocmd GUIEnter * simalt ~x
else
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
  set guifont=Osaka−等幅:h24
endif
set guioptions-=b
set guioptions-=l
set guioptions-=r
set guioptions-=e
set guioptions-=m
set guioptions-=M
set guioptions-=T
set guioptions+=PR

function! GuiTabLabel()
    "return fnamemodify(bufname(winbufnr(1)), ":t")
    return bufname("%")
endfunction
set guitablabel=%{GuiTabLabel()}
