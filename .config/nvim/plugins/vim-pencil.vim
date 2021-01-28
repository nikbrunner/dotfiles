let g:pencil#textwidth = 74

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'hard'})
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END
