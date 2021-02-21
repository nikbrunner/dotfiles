let g:gruvbox_contrast_dark="hard"

let g:gruvbox_material_background = 'hard'

colorscheme gruvbox-material

" hi Normal            guibg=NONE               ctermbg=NONE

" hi TabLineFill       guibg=NONE               ctermfg=NONE  ctermbg=NONE      cterm=NONE
" hi TabLine           guibg=NONE               ctermfg=NONE  ctermbg=NONE      cterm=NONE
" hi TabLineSel        guibg=NONE guifg=#8fbcbb  ctermfg=Black ctermbg=Yellow    cterm=NONE

" hi SignColumn        guibg=NONE

" hi Comment                                                      cterm=italic
" hi Conditional                                                  cterm=italic,bold

" hi VertSplit         guibg=NONE guifg=#8fbcbb

" Switching themes
" map <F6>             :colorscheme nord <bar> let g:airline_theme='bubblegum' <bar> set background=dark<CR>
" map <F7>             :colorscheme gruvbox <bar> let g:airline_theme='gruvbox' <bar> set background=dark<CR>

" nord nord theme
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
augroup END

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75
hi tsxCloseTagName guifg=#E06C75
hi tsxCloseTag guifg=#E06C75


" orange
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxComponentName guifg=#F99575
hi tsxCloseComponentName guifg=#E06C75

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
