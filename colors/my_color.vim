" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "torte"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=white	guibg=Black
highlight Search     guifg=white	guibg=blue	gui=bold
highlight Visual					gui=reverse
highlight Cursor     guifg=Black	guibg=Green	gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=green	gui=bold
highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=Yellow			gui=NONE
highlight Type			guifg=DodgerBlue gui=bold
highlight Conditional	guifg=DodgerBlue gui=bold
highlight Statement	guifg=DodgerBlue gui=bold
highlight Repeat		guifg=DodgerBlue gui=bold
highlight Operator		guifg=DodgerBlue gui=bold
highlight Label			guifg=DodgerBlue gui=bold
highlight StorageClass guifg=cyan gui=bold
highlight Structure	guifg=cyan gui=bold
highlight String		guifg=red
highlight Character		guifg=red
highlight PreProc		guifg=cyan gui=bold
highlight Number		guifg=lightred
highlight WarningMsg	guifg=red
highlight TabLineSel	guifg=red
highlight CursorLine	guibg=#333333

" Console
highlight Normal     ctermfg=white		ctermbg=Black
highlight Search     ctermfg=white	ctermbg=blue	cterm=bold
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight Special    ctermfg=magenta
highlight Comment    ctermfg=green      cterm=bold
highlight StatusLine ctermfg=blue	ctermbg=white   cterm=bold
highlight Statement  ctermfg=Yellow			cterm=NONE
highlight Type		ctermfg=blue				cterm=bold
highlight Conditional    ctermfg=blue   cterm=bold
highlight Title			ctermfg=red
highlight PreProc    ctermfg=cyan   cterm=bold
highlight String     ctermfg=red
highlight Character  ctermfg=red
highlight Constant   ctermfg=yellow
highlight StorageClass ctermfg=cyan cterm=bold
highlight Structure	ctermfg=cyan
highlight Label			ctermfg=yellow
highlight Number		ctermfg=magenta
highlight Repeat		ctermfg=blue cterm=bold
highlight Operator		ctermfg=cyan
highlight cppOperator		ctermfg=cyan
highlight Directory		ctermfg=cyan
highlight WarningMsg		ctermfg=red
highlight DiffText		ctermbg=darkred
highlight TabLineSel	ctermfg=red


"========= RST ============
highlight rstSections ctermfg=cyan	cterm=bold

"========= ruby ============
highlight rubyConstant ctermfg=yellow	cterm=bold

"========= javascript ============
highlight javaScriptValue ctermfg=magenta guifg=lightred

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif

