if has("win32")
  set guifont=Ricty_Diminished:h20
  set renderoptions=type:directx
else
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
  set guifont=Osaka−等幅:h24
endif
set guioptions-=e
set guioptions-=m
set guioptions-=M
set guioptions-=T
set guioptions+=PR
