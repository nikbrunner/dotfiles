" let g:gruvbox_contrast_dark="hard"

colorscheme nord

hi Normal            guibg=NONE               ctermbg=NONE

hi TabLineFill       guibg=NONE               ctermfg=NONE  ctermbg=NONE      cterm=NONE
hi TabLine           guibg=NONE               ctermfg=NONE  ctermbg=NONE      cterm=NONE
hi TabLineSel        guibg=NONE guifg=#8fbcbb  ctermfg=Black ctermbg=Yellow    cterm=NONE

hi SignColumn        guibg=NONE

hi Comment                                                      cterm=italic
hi Conditional                                                  cterm=italic,bold

hi VertSplit         guibg=NONE guifg=#8fbcbb

" Switching themes
map <F6>             :colorscheme nord <bar> let g:airline_theme='bubblegum' <bar> set background=dark<CR>
map <F7>             :colorscheme gruvbox <bar> let g:airline_theme='gruvbox' <bar> set background=dark<CR>
