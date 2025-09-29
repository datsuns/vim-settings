if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-peek-definition)
  nmap <buffer> gD <plug>(lsp-definition)
  nmap <buffer> gT :execute(":tab LspDefinition")<CR>
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation))
  nmap <buffer> gt <plug>(lsp-type-definition))
  nmap <buffer> gl :LspDocumentDiagnostics<CR>
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
  nnoremap <buffer> <expr><c-j> lsp#scroll(+2)
  nnoremap <buffer> <expr><f4>  lsp#scroll(+2)
  nnoremap <buffer> <expr><c-k> lsp#scroll(-2)
  nnoremap <buffer> <expr><f3>  lsp#scroll(-2)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" let g:lsp_log_verbose = 1
" let g:lsp_log_file    = expand('~/desktop/lsp.log')
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/desktop/lsp.log')

let g:lsp_auto_enable                      = 1
let g:lsp_preview_keep_focus               = 1
let g:lsp_preview_float                    = 1
let g:lsp_diagnostics_float_cursor         = 0
let g:lsp_preview_autoclose                = 1
let g:lsp_insert_text_enabled              = 1
let g:lsp_text_edit_enabled                = 1
let g:lsp_completion_documentation_enabled = 1
let g:lsp_diagnostics_enabled              = 1
let g:lsp_diagnostics_echo_cursor          = 0
let g:lsp_diagnostics_highlights_enabled   = 0
let g:lsp_diagnostics_signs_enabled        = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_align   = "after"
let g:lsp_diagnostics_virtual_text_wrap    = "truncate"
let g:lsp_diagnostics_virtual_text_padding_left = 4
let g:asyncomplete_enable_for_all          = 1
let g:asyncomplete_auto_popup              = 1
let g:asyncomplete_auto_completeopt        = 1
let g:asyncomplete_popup_delay             = 0
let g:asyncomplete_min_chars               = 0

augroup MyLspAutoCommand
  autocmd!
  autocmd BufWritePre *.go     call execute('LspDocumentFormatSync') | call execute('LspCodeActionSync source.organizeImports')
  autocmd BufWritePre *.cpp    :execute("LspDocumentFormatSync")
  autocmd BufWritePre *.cc     :execute("LspDocumentFormatSync")
  autocmd BufWritePre *.h      :execute("LspDocumentFormatSync")
  autocmd BufWritePre *.c      :execute("LspDocumentFormatSync")
  autocmd BufWritePre *.rs     :execute("LspDocumentFormatSync")
  autocmd BufWritePre *.svelte :execute("LspDocumentFormatSync")
  autocmd BufWritePre *.py     :execute("LspDocumentFormatSync")
  autocmd BufWritePre *.cs     :execute("LspDocumentFormatSync")
augroup END


" cpp: gcc -xc++ -E -v -
let g:lsp_settings = {
\   'efm-langserver': {
\    'disabled': 0,
\    'allowlist': [
\       "markdown",
\      ]
\   },
\   'clangd': {
\     'args': [
\           '--compile-commands-dir=/dev/null',
\           '--background-index',
\           '--clang-tidy',
\      ]
\   },
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'plugins': {
\           'pycodestyle': {
\             'ignore': ["E221", "E265", "E501", "E704"]
\           }
\         }
\       }
\     }
\   },
\}
