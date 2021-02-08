let g:gruvbox_contrast_dark="hard"
let ayucolor="mirage"
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

colorscheme gruvbox

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

augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
augroup END
