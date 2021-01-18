" general
source $HOME/.config/nvim/general/sets.vim
source $HOME/.config/nvim/general/theme.vim
source $HOME/.config/nvim/general/maps.vim
source $HOME/.config/nvim/general/autocmd.vim
source $HOME/.config/nvim/general/spellcheck.vim

" plugins
source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/plugins/vim-fzf.vim
source $HOME/.config/nvim/plugins/vim-gitgutter.vim
source $HOME/.config/nvim/plugins/vim-fugitive.vim
source $HOME/.config/nvim/plugins/vim-coc.vim
source $HOME/.config/nvim/plugins/vim-emmet.vim
source $HOME/.config/nvim/plugins/vim-nerdtree.vim

nnoremap <silent>™                           <cmd>CHADopen<cr>

" highlight yanking
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
